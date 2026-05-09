; DESCRIPTION: Places a purple 120x15 rectangle at position (204, 85).
; PLAN: r0=204(x), r1=85(y), r2=120(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 85
LDI r2, 120
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
