; DESCRIPTION: Places a yellow 64x107 rectangle at position (378, 27).
; PLAN: r0=378(x), r1=27(y), r2=64(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 27
LDI r2, 64
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
