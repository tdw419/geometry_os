; DESCRIPTION: Places a orange 65x80 rectangle at position (168, 58).
; PLAN: r0=168(x), r1=58(y), r2=65(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 58
LDI r2, 65
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
