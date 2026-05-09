; DESCRIPTION: Places a white 97x47 rectangle at position (157, 123).
; PLAN: r0=157(x), r1=123(y), r2=97(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 123
LDI r2, 97
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
