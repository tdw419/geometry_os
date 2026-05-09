; DESCRIPTION: Places a yellow 33x102 rectangle at position (162, 52).
; PLAN: r0=162(x), r1=52(y), r2=33(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 52
LDI r2, 33
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
