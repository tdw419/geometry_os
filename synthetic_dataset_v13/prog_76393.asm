; DESCRIPTION: Places a white 65x105 rectangle at position (97, 114).
; PLAN: r0=97(x), r1=114(y), r2=65(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 114
LDI r2, 65
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
