; DESCRIPTION: Places a orange 48x84 rectangle at position (285, 123).
; PLAN: r0=285(x), r1=123(y), r2=48(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 123
LDI r2, 48
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
