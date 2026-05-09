; DESCRIPTION: Composite: Renders a yellow disk with center (81, 122) and radius 73 then Renders a green box of size 45x13 starting at (362, 111) then Renders a red line between points (465, 4) and (272, 215).
; PLAN: r0=81(x), r1=122(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=111(y), r7=45(width), r8=13(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x1), r11=4(y1), r12=272(x2), r13=215(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 81
LDI r1, 122
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 111
LDI r7, 45
LDI r8, 13
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 4
LDI r12, 272
LDI r13, 215
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
