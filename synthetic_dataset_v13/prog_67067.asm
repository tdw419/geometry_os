; DESCRIPTION: Places a orange 65x37 rectangle at position (283, 192).
; PLAN: r0=283(x), r1=192(y), r2=65(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 192
LDI r2, 65
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
