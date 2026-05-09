; DESCRIPTION: Places a white 110x107 rectangle at position (174, 33).
; PLAN: r0=174(x), r1=33(y), r2=110(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 33
LDI r2, 110
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
