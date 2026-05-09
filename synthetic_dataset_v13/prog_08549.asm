; DESCRIPTION: Places a yellow 52x104 rectangle at position (88, 8).
; PLAN: r0=88(x), r1=8(y), r2=52(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 8
LDI r2, 52
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
