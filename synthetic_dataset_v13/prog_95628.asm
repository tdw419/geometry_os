; DESCRIPTION: Places a orange 29x52 rectangle at position (321, 175).
; PLAN: r0=321(x), r1=175(y), r2=29(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 175
LDI r2, 29
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
