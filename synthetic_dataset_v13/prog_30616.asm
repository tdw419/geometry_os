; DESCRIPTION: Places a white 44x102 rectangle at position (208, 110).
; PLAN: r0=208(x), r1=110(y), r2=44(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 110
LDI r2, 44
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
