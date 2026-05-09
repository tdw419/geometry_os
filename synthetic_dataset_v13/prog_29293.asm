; DESCRIPTION: Places a yellow 56x52 rectangle at position (254, 55).
; PLAN: r0=254(x), r1=55(y), r2=56(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 55
LDI r2, 56
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
