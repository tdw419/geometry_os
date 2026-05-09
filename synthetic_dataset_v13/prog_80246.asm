; DESCRIPTION: Renders a orange box of size 60x82 starting at (308, 25).
; PLAN: r0=308(x), r1=25(y), r2=60(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 25
LDI r2, 60
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
