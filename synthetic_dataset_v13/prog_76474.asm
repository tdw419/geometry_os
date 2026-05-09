; DESCRIPTION: Places a white 97x31 rectangle at position (265, 21).
; PLAN: r0=265(x), r1=21(y), r2=97(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 21
LDI r2, 97
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
