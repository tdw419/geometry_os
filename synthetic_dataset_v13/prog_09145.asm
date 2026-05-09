; DESCRIPTION: Places a red 99x110 rectangle at position (211, 101).
; PLAN: r0=211(x), r1=101(y), r2=99(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 101
LDI r2, 99
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
