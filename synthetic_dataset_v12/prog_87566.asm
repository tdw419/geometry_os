; DESCRIPTION: Places a cyan 51x104 rectangle at position (31, 126).
; PLAN: r0=31(x), r1=126(y), r2=51(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 126
LDI r2, 51
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
