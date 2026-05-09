; DESCRIPTION: Draws a red rectangle at (439, 180) with width 24 and height 57.
; PLAN: r0=439(x), r1=180(y), r2=24(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 180
LDI r2, 24
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
