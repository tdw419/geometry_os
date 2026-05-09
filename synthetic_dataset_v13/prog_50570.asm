; DESCRIPTION: Places a white 62x99 rectangle at position (31, 17).
; PLAN: r0=31(x), r1=17(y), r2=62(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 17
LDI r2, 62
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
