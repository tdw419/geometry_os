; DESCRIPTION: Places a yellow 36x50 rectangle at position (1, 114).
; PLAN: r0=1(x), r1=114(y), r2=36(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 114
LDI r2, 36
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
