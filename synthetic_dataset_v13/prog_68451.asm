; DESCRIPTION: Places a purple 52x13 rectangle at position (443, 200).
; PLAN: r0=443(x), r1=200(y), r2=52(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 200
LDI r2, 52
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
