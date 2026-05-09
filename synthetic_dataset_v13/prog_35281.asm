; DESCRIPTION: Composite: Renders a blue box of size 17x59 starting at (10, 98) then Draws a white line from (9, 50) to (50, 218).
; PLAN: r0=10(x), r1=98(y), r2=17(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=50(y1), r7=50(x2), r8=218(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 98
LDI r2, 17
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 50
LDI r7, 50
LDI r8, 218
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
