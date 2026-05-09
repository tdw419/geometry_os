; DESCRIPTION: Places a white 80x15 rectangle at position (423, 102).
; PLAN: r0=423(x), r1=102(y), r2=80(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 102
LDI r2, 80
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
