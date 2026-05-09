; DESCRIPTION: Composite: Places a cyan dot at position (273, 226) then Renders a magenta disk with center (356, 114) and radius 60 then Draws a blue line from (337, 109) to (327, 206).
; PLAN: r0=273(x), r1=226(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=114(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x1), r11=109(y1), r12=327(x2), r13=206(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 226
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 114
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 109
LDI r12, 327
LDI r13, 206
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
