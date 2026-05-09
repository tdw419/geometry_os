; DESCRIPTION: Places a orange 99x46 rectangle at position (144, 192).
; PLAN: r0=144(x), r1=192(y), r2=99(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 192
LDI r2, 99
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
