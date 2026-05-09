; DESCRIPTION: Places a green 58x52 rectangle at position (31, 39).
; PLAN: r0=31(x), r1=39(y), r2=58(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 39
LDI r2, 58
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
