; DESCRIPTION: Places a yellow 90x75 rectangle at position (52, 176).
; PLAN: r0=52(x), r1=176(y), r2=90(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 176
LDI r2, 90
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
