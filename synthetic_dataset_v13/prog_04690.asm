; DESCRIPTION: Places a red 101x41 rectangle at position (369, 203).
; PLAN: r0=369(x), r1=203(y), r2=101(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 203
LDI r2, 101
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
