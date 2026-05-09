; DESCRIPTION: Places a white 44x93 rectangle at position (125, 58).
; PLAN: r0=125(x), r1=58(y), r2=44(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 58
LDI r2, 44
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
