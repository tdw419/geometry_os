; DESCRIPTION: Places a white 19x44 rectangle at position (138, 161).
; PLAN: r0=138(x), r1=161(y), r2=19(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 161
LDI r2, 19
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
