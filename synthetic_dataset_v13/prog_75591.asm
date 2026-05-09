; DESCRIPTION: Composite: Places a cyan 33x33 rectangle at position (421, 83) then Draws a orange line from (335, 238) to (415, 252).
; PLAN: r0=421(x), r1=83(y), r2=33(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=335(x1), r6=238(y1), r7=415(x2), r8=252(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 83
LDI r2, 33
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 238
LDI r7, 415
LDI r8, 252
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
