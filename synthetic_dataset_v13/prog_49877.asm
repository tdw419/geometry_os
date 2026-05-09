; DESCRIPTION: Composite: Renders a orange box of size 117x14 starting at (84, 229) then Draws a white line from (278, 32) to (33, 44).
; PLAN: r0=84(x), r1=229(y), r2=117(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=32(y1), r7=33(x2), r8=44(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 229
LDI r2, 117
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 32
LDI r7, 33
LDI r8, 44
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
