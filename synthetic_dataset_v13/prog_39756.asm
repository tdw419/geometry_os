; DESCRIPTION: Places a white 115x46 rectangle at position (241, 119).
; PLAN: r0=241(x), r1=119(y), r2=115(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 119
LDI r2, 115
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
