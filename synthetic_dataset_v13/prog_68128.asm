; DESCRIPTION: Renders a orange box of size 95x30 starting at (126, 104).
; PLAN: r0=126(x), r1=104(y), r2=95(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 104
LDI r2, 95
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
