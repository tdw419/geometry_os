; DESCRIPTION: Renders a orange box of size 61x82 starting at (370, 157).
; PLAN: r0=370(x), r1=157(y), r2=61(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 157
LDI r2, 61
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
