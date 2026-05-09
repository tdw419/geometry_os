; DESCRIPTION: Places a red 59x80 rectangle at position (184, 123).
; PLAN: r0=184(x), r1=123(y), r2=59(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 123
LDI r2, 59
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
