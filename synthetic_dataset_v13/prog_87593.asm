; DESCRIPTION: Renders a orange box of size 71x41 starting at (354, 125).
; PLAN: r0=354(x), r1=125(y), r2=71(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 125
LDI r2, 71
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
