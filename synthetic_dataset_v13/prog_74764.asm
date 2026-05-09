; DESCRIPTION: Places a white 26x99 rectangle at position (13, 37).
; PLAN: r0=13(x), r1=37(y), r2=26(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 37
LDI r2, 26
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
