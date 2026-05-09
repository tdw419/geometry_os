; DESCRIPTION: Composite: Places a yellow circle of radius 10 at center (465, 151) then Renders a purple box of size 13x39 starting at (324, 152) then Draws a black line from (50, 9) to (271, 220).
; PLAN: r0=465(x), r1=151(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=152(y), r7=13(width), r8=39(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=50(x1), r11=9(y1), r12=271(x2), r13=220(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 151
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 152
LDI r7, 13
LDI r8, 39
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 9
LDI r12, 271
LDI r13, 220
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
