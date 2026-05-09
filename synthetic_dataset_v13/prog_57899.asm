; DESCRIPTION: Places a red 54x110 rectangle at position (396, 73).
; PLAN: r0=396(x), r1=73(y), r2=54(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 73
LDI r2, 54
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
