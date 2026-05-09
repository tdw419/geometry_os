; DESCRIPTION: Places a green 78x39 rectangle at position (100, 100).
; PLAN: r0=100(x), r1=100(y), r2=78(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 100
LDI r2, 78
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
