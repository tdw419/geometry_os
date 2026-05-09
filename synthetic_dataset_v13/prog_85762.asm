; DESCRIPTION: Composite: Places a cyan 14x40 rectangle at position (151, 11) then Draws a orange line from (256, 108) to (172, 50).
; PLAN: r0=151(x), r1=11(y), r2=14(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x1), r6=108(y1), r7=172(x2), r8=50(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 11
LDI r2, 14
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 108
LDI r7, 172
LDI r8, 50
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
