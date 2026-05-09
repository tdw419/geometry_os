; DESCRIPTION: Places a green 101x83 rectangle at position (246, 41).
; PLAN: r0=246(x), r1=41(y), r2=101(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 41
LDI r2, 101
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
