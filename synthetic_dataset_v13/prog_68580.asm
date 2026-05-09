; DESCRIPTION: Places a yellow 77x38 rectangle at position (52, 108).
; PLAN: r0=52(x), r1=108(y), r2=77(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 108
LDI r2, 77
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
