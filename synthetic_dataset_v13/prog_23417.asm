; DESCRIPTION: Places a yellow 41x37 rectangle at position (179, 212).
; PLAN: r0=179(x), r1=212(y), r2=41(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 212
LDI r2, 41
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
