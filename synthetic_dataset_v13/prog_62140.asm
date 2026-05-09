; DESCRIPTION: Draws a red rectangle at (308, 60) with width 76 and height 71.
; PLAN: r0=308(x), r1=60(y), r2=76(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 60
LDI r2, 76
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
