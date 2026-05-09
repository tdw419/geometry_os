; DESCRIPTION: Places a orange 110x21 rectangle at position (159, 208).
; PLAN: r0=159(x), r1=208(y), r2=110(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 208
LDI r2, 110
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
