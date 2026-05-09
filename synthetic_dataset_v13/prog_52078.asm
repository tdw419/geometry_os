; DESCRIPTION: Places a white 21x110 rectangle at position (382, 44).
; PLAN: r0=382(x), r1=44(y), r2=21(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 44
LDI r2, 21
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
