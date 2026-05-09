; DESCRIPTION: Draws a red rectangle at (394, 116) with width 107 and height 50.
; PLAN: r0=394(x), r1=116(y), r2=107(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 116
LDI r2, 107
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
