; DESCRIPTION: Renders a orange box of size 110x82 starting at (335, 61).
; PLAN: r0=335(x), r1=61(y), r2=110(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 61
LDI r2, 110
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
