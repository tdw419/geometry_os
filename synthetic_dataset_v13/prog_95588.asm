; DESCRIPTION: Composite: Renders a orange box of size 115x78 starting at (298, 90) then Draws a blue line from (388, 231) to (505, 45).
; PLAN: r0=298(x), r1=90(y), r2=115(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x1), r6=231(y1), r7=505(x2), r8=45(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 298
LDI r1, 90
LDI r2, 115
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 231
LDI r7, 505
LDI r8, 45
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
