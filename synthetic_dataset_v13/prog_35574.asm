; DESCRIPTION: Renders a orange box of size 91x19 starting at (166, 235).
; PLAN: r0=166(x), r1=235(y), r2=91(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 235
LDI r2, 91
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
