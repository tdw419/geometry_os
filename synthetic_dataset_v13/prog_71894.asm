; DESCRIPTION: Places a purple 85x93 rectangle at position (399, 91).
; PLAN: r0=399(x), r1=91(y), r2=85(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 91
LDI r2, 85
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
