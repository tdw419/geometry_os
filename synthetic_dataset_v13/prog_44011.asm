; DESCRIPTION: Places a white 31x117 rectangle at position (309, 89).
; PLAN: r0=309(x), r1=89(y), r2=31(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 89
LDI r2, 31
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
