; DESCRIPTION: Places a black 107x71 rectangle at position (194, 180).
; PLAN: r0=194(x), r1=180(y), r2=107(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 180
LDI r2, 107
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
