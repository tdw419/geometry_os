; DESCRIPTION: Places a cyan 116x100 rectangle at position (347, 78).
; PLAN: r0=347(x), r1=78(y), r2=116(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 78
LDI r2, 116
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
