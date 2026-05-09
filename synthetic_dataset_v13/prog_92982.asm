; DESCRIPTION: Composite: Sets a single magenta pixel at (331, 153) then Renders a magenta disk with center (99, 102) and radius 66 then Renders a cyan line between points (267, 210) and (196, 60).
; PLAN: r0=331(x), r1=153(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=102(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=267(x1), r11=210(y1), r12=196(x2), r13=60(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 153
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 102
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 267
LDI r11, 210
LDI r12, 196
LDI r13, 60
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
