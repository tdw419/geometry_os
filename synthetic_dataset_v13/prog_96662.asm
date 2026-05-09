; DESCRIPTION: Places a yellow 45x52 rectangle at position (166, 25).
; PLAN: r0=166(x), r1=25(y), r2=45(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 25
LDI r2, 45
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
