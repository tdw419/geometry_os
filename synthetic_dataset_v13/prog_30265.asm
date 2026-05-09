; DESCRIPTION: Places a yellow 95x99 rectangle at position (252, 27).
; PLAN: r0=252(x), r1=27(y), r2=95(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 27
LDI r2, 95
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
