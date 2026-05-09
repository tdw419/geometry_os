; DESCRIPTION: Places a white 89x55 rectangle at position (40, 141).
; PLAN: r0=40(x), r1=141(y), r2=89(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 141
LDI r2, 89
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
