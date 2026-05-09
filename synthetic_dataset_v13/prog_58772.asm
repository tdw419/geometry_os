; DESCRIPTION: Places a white 28x25 rectangle at position (272, 49).
; PLAN: r0=272(x), r1=49(y), r2=28(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 49
LDI r2, 28
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
