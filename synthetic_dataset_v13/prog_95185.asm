; DESCRIPTION: Renders a orange box of size 29x107 starting at (403, 125).
; PLAN: r0=403(x), r1=125(y), r2=29(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 125
LDI r2, 29
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
