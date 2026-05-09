; DESCRIPTION: Draws a red rectangle at (308, 74) with width 47 and height 47.
; PLAN: r0=308(x), r1=74(y), r2=47(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 74
LDI r2, 47
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
