; DESCRIPTION: Places a white 97x73 rectangle at position (71, 156).
; PLAN: r0=71(x), r1=156(y), r2=97(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 156
LDI r2, 97
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
