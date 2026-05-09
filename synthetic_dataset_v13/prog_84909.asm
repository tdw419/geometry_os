; DESCRIPTION: Places a white 119x47 rectangle at position (241, 56).
; PLAN: r0=241(x), r1=56(y), r2=119(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 56
LDI r2, 119
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
