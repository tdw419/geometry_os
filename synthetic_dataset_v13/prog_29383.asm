; DESCRIPTION: Places a purple 119x91 rectangle at position (2, 109).
; PLAN: r0=2(x), r1=109(y), r2=119(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 109
LDI r2, 119
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
