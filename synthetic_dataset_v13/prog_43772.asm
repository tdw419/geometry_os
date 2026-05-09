; DESCRIPTION: Places a purple 11x91 rectangle at position (328, 85).
; PLAN: r0=328(x), r1=85(y), r2=11(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 85
LDI r2, 11
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
