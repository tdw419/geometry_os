; DESCRIPTION: Places a red 29x41 rectangle at position (241, 147).
; PLAN: r0=241(x), r1=147(y), r2=29(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 147
LDI r2, 29
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
