; DESCRIPTION: Places a green 71x107 rectangle at position (252, 1).
; PLAN: r0=252(x), r1=1(y), r2=71(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 1
LDI r2, 71
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
