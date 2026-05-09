; DESCRIPTION: Places a white 48x51 rectangle at position (417, 44).
; PLAN: r0=417(x), r1=44(y), r2=48(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 44
LDI r2, 48
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
