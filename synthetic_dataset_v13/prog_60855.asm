; DESCRIPTION: Composite: Places a blue dot at position (171, 67) then Renders a purple line between points (221, 161) and (481, 226) then Places a blue circle of radius 16 at center (98, 123).
; PLAN: r0=171(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=221(x1), r6=161(y1), r7=481(x2), r8=226(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=123(y), r12=16(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 161
LDI r7, 481
LDI r8, 226
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 123
LDI r12, 16
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
