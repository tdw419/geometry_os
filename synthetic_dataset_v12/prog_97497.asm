; DESCRIPTION: Places a orange 105x36 rectangle at position (251, 130).
; PLAN: r0=251(x), r1=130(y), r2=105(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 130
LDI r2, 105
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
