; DESCRIPTION: Places a white 81x90 rectangle at position (204, 64).
; PLAN: r0=204(x), r1=64(y), r2=81(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 64
LDI r2, 81
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
