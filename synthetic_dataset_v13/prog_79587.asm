; DESCRIPTION: Places a red 76x55 rectangle at position (270, 41).
; PLAN: r0=270(x), r1=41(y), r2=76(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 41
LDI r2, 76
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
