; DESCRIPTION: Composite: Draws a cyan line from (448, 19) to (377, 64) then Creates a orange rectangular region at (323, 88) spanning 90 by 103 pixels.
; PLAN: r0=448(x1), r1=19(y1), r2=377(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=323(x), r6=88(y), r7=90(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 19
LDI r2, 377
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 88
LDI r7, 90
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
