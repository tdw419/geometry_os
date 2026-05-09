; DESCRIPTION: Places a green 119x89 rectangle at position (264, 43).
; PLAN: r0=264(x), r1=43(y), r2=119(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 43
LDI r2, 119
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
