; DESCRIPTION: Places a white 44x23 rectangle at position (115, 3).
; PLAN: r0=115(x), r1=3(y), r2=44(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 3
LDI r2, 44
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
