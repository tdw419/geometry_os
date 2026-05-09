; DESCRIPTION: Renders a white box of size 97x11 starting at (304, 10).
; PLAN: r0=304(x), r1=10(y), r2=97(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 10
LDI r2, 97
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
