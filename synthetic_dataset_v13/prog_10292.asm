; DESCRIPTION: Places a red 47x31 rectangle at position (49, 51).
; PLAN: r0=49(x), r1=51(y), r2=47(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 51
LDI r2, 47
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
