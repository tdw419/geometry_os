; DESCRIPTION: Renders a orange box of size 120x30 starting at (167, 61).
; PLAN: r0=167(x), r1=61(y), r2=120(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 61
LDI r2, 120
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
