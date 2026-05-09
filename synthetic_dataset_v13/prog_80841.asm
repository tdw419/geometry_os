; DESCRIPTION: Places a black 16x17 rectangle at position (77, 162).
; PLAN: r0=77(x), r1=162(y), r2=16(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 162
LDI r2, 16
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
