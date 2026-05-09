; DESCRIPTION: Places a orange 106x52 rectangle at position (245, 39).
; PLAN: r0=245(x), r1=39(y), r2=106(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 39
LDI r2, 106
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
