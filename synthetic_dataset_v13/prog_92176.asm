; DESCRIPTION: Composite: Draws a blue line from (43, 127) to (98, 200) then Places a orange 88x99 rectangle at position (400, 50).
; PLAN: r0=43(x1), r1=127(y1), r2=98(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=50(y), r7=88(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 127
LDI r2, 98
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 50
LDI r7, 88
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
