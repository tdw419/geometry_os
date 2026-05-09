; DESCRIPTION: Places a yellow 78x85 rectangle at position (425, 122).
; PLAN: r0=425(x), r1=122(y), r2=78(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 122
LDI r2, 78
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
