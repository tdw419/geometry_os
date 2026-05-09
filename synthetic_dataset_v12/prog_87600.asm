; DESCRIPTION: Places a orange 24x100 rectangle at position (272, 123).
; PLAN: r0=272(x), r1=123(y), r2=24(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 123
LDI r2, 24
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
