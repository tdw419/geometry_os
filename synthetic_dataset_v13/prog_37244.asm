; DESCRIPTION: Places a green 31x69 rectangle at position (468, 141).
; PLAN: r0=468(x), r1=141(y), r2=31(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 141
LDI r2, 31
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
