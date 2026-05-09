; DESCRIPTION: Draws a red rectangle at (439, 44) with width 31 and height 105.
; PLAN: r0=439(x), r1=44(y), r2=31(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 44
LDI r2, 31
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
