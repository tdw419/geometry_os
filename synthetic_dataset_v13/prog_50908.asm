; DESCRIPTION: Places a yellow 75x40 rectangle at position (234, 162).
; PLAN: r0=234(x), r1=162(y), r2=75(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 162
LDI r2, 75
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
