; DESCRIPTION: Places a red 47x91 rectangle at position (339, 119).
; PLAN: r0=339(x), r1=119(y), r2=47(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 119
LDI r2, 47
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
