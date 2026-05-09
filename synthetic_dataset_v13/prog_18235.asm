; DESCRIPTION: Places a yellow 76x66 rectangle at position (162, 112).
; PLAN: r0=162(x), r1=112(y), r2=76(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 112
LDI r2, 76
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
