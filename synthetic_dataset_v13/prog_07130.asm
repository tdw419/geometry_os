; DESCRIPTION: Places a green 52x76 rectangle at position (200, 1).
; PLAN: r0=200(x), r1=1(y), r2=52(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 1
LDI r2, 52
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
