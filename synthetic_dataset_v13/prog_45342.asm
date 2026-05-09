; DESCRIPTION: Places a black 81x23 rectangle at position (346, 192).
; PLAN: r0=346(x), r1=192(y), r2=81(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 192
LDI r2, 81
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
