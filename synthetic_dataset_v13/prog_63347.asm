; DESCRIPTION: Places a red 11x37 rectangle at position (329, 44).
; PLAN: r0=329(x), r1=44(y), r2=11(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 44
LDI r2, 11
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
