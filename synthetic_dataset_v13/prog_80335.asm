; DESCRIPTION: Places a yellow 87x110 rectangle at position (172, 6).
; PLAN: r0=172(x), r1=6(y), r2=87(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 6
LDI r2, 87
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
