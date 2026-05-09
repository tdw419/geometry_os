; DESCRIPTION: Places a red 76x105 rectangle at position (423, 110).
; PLAN: r0=423(x), r1=110(y), r2=76(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 110
LDI r2, 76
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
