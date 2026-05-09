; DESCRIPTION: Places a white 39x83 rectangle at position (444, 115).
; PLAN: r0=444(x), r1=115(y), r2=39(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 115
LDI r2, 39
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
