; DESCRIPTION: Places a white 64x73 rectangle at position (140, 170).
; PLAN: r0=140(x), r1=170(y), r2=64(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 170
LDI r2, 64
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
