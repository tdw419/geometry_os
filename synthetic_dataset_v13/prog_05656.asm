; DESCRIPTION: Composite: Draws a magenta line from (220, 153) to (455, 162) then Renders a green disk with center (413, 20) and radius 16 then Places a magenta dot at position (34, 92).
; PLAN: r0=220(x1), r1=153(y1), r2=455(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=413(x), r6=20(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=34(x), r11=92(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 220
LDI r1, 153
LDI r2, 455
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 20
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 34
LDI r11, 92
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
