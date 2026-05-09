; DESCRIPTION: Places a yellow 110x52 rectangle at position (129, 21).
; PLAN: r0=129(x), r1=21(y), r2=110(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 21
LDI r2, 110
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
