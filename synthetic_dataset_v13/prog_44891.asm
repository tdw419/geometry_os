; DESCRIPTION: Places a yellow 11x70 rectangle at position (166, 176).
; PLAN: r0=166(x), r1=176(y), r2=11(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 176
LDI r2, 11
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
