; DESCRIPTION: Places a white 119x90 rectangle at position (9, 78).
; PLAN: r0=9(x), r1=78(y), r2=119(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 78
LDI r2, 119
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
