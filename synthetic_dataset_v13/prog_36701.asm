; DESCRIPTION: Places a black 18x74 rectangle at position (415, 51).
; PLAN: r0=415(x), r1=51(y), r2=18(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 51
LDI r2, 18
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
