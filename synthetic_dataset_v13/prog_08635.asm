; DESCRIPTION: Places a white 25x119 rectangle at position (94, 0).
; PLAN: r0=94(x), r1=0(y), r2=25(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 0
LDI r2, 25
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
