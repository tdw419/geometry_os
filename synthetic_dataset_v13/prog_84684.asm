; DESCRIPTION: Places a white 43x21 rectangle at position (44, 97).
; PLAN: r0=44(x), r1=97(y), r2=43(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 97
LDI r2, 43
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
