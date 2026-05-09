; DESCRIPTION: Places a green 52x38 rectangle at position (194, 76).
; PLAN: r0=194(x), r1=76(y), r2=52(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 76
LDI r2, 52
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
