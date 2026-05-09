; DESCRIPTION: Renders a orange box of size 88x95 starting at (235, 16).
; PLAN: r0=235(x), r1=16(y), r2=88(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 16
LDI r2, 88
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
