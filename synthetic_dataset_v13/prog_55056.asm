; DESCRIPTION: Places a yellow 17x63 rectangle at position (104, 95).
; PLAN: r0=104(x), r1=95(y), r2=17(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 95
LDI r2, 17
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
