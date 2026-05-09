; DESCRIPTION: Places a orange 45x36 rectangle at position (192, 29).
; PLAN: r0=192(x), r1=29(y), r2=45(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 29
LDI r2, 45
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
