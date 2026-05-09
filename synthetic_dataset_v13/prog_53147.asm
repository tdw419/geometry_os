; DESCRIPTION: Composite: Places a purple 57x22 rectangle at position (45, 20) then Places a cyan line segment connecting (454, 171) to (71, 214) then Renders a blue disk with center (39, 195) and radius 25.
; PLAN: r0=45(x), r1=20(y), r2=57(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=171(y1), r7=71(x2), r8=214(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=195(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 45
LDI r1, 20
LDI r2, 57
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 171
LDI r7, 71
LDI r8, 214
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 195
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
