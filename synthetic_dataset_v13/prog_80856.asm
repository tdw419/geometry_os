; DESCRIPTION: Places a yellow 52x92 rectangle at position (339, 68).
; PLAN: r0=339(x), r1=68(y), r2=52(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 68
LDI r2, 52
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
