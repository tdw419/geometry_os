; DESCRIPTION: Places a purple 18x109 rectangle at position (120, 141).
; PLAN: r0=120(x), r1=141(y), r2=18(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 141
LDI r2, 18
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
