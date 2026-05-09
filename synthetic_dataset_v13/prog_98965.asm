; DESCRIPTION: Places a orange 101x25 rectangle at position (347, 168).
; PLAN: r0=347(x), r1=168(y), r2=101(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 168
LDI r2, 101
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
