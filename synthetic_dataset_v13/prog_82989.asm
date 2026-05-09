; DESCRIPTION: Places a yellow 91x84 rectangle at position (131, 162).
; PLAN: r0=131(x), r1=162(y), r2=91(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 162
LDI r2, 91
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
