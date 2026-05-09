; DESCRIPTION: Composite: Renders a purple box of size 40x23 starting at (404, 20) then Places a cyan circle of radius 69 at center (345, 124) then Draws a black line from (123, 94) to (470, 69).
; PLAN: r0=404(x), r1=20(y), r2=40(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=124(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=123(x1), r11=94(y1), r12=470(x2), r13=69(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 20
LDI r2, 40
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 124
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 123
LDI r11, 94
LDI r12, 470
LDI r13, 69
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
