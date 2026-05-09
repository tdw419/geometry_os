; DESCRIPTION: Places a yellow 116x50 rectangle at position (347, 105).
; PLAN: r0=347(x), r1=105(y), r2=116(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 105
LDI r2, 116
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
