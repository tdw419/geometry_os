; DESCRIPTION: Places a purple 65x80 rectangle at position (184, 109).
; PLAN: r0=184(x), r1=109(y), r2=65(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 109
LDI r2, 65
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
