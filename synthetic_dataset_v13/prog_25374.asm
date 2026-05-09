; DESCRIPTION: Places a white 49x64 rectangle at position (97, 107).
; PLAN: r0=97(x), r1=107(y), r2=49(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 107
LDI r2, 49
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
