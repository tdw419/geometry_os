; DESCRIPTION: Places a orange 96x63 rectangle at position (17, 123).
; PLAN: r0=17(x), r1=123(y), r2=96(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 123
LDI r2, 96
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
