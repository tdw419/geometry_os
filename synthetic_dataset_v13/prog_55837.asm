; DESCRIPTION: Places a white 15x31 rectangle at position (44, 165).
; PLAN: r0=44(x), r1=165(y), r2=15(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 165
LDI r2, 15
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
