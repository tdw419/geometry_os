; DESCRIPTION: Places a yellow 115x38 rectangle at position (252, 98).
; PLAN: r0=252(x), r1=98(y), r2=115(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 98
LDI r2, 115
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
