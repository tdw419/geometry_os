; DESCRIPTION: Places a yellow 101x117 rectangle at position (252, 20).
; PLAN: r0=252(x), r1=20(y), r2=101(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 20
LDI r2, 101
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
