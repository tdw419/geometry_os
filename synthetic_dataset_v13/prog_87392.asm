; DESCRIPTION: Renders a orange box of size 79x61 starting at (292, 5).
; PLAN: r0=292(x), r1=5(y), r2=79(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 5
LDI r2, 79
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
