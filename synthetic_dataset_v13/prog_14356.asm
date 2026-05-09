; DESCRIPTION: Places a yellow 113x43 rectangle at position (33, 162).
; PLAN: r0=33(x), r1=162(y), r2=113(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 162
LDI r2, 113
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
