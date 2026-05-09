; DESCRIPTION: Places a orange 37x46 rectangle at position (247, 192).
; PLAN: r0=247(x), r1=192(y), r2=37(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 192
LDI r2, 37
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
