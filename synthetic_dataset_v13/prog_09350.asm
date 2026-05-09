; DESCRIPTION: Places a white 97x43 rectangle at position (382, 163).
; PLAN: r0=382(x), r1=163(y), r2=97(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 163
LDI r2, 97
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
