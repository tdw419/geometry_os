; DESCRIPTION: Places a yellow 41x117 rectangle at position (117, 74).
; PLAN: r0=117(x), r1=74(y), r2=41(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 74
LDI r2, 41
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
