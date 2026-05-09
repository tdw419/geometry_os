; DESCRIPTION: Places a yellow 52x75 rectangle at position (205, 19).
; PLAN: r0=205(x), r1=19(y), r2=52(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 19
LDI r2, 52
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
