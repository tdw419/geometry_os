; DESCRIPTION: Renders a orange box of size 102x81 starting at (365, 125).
; PLAN: r0=365(x), r1=125(y), r2=102(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 125
LDI r2, 102
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
