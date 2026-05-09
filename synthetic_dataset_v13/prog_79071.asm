; DESCRIPTION: Places a white 117x33 rectangle at position (31, 197).
; PLAN: r0=31(x), r1=197(y), r2=117(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 197
LDI r2, 117
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
