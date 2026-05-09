; DESCRIPTION: Draws a red rectangle at (25, 194) with width 120 and height 50.
; PLAN: r0=25(x), r1=194(y), r2=120(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 194
LDI r2, 120
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
