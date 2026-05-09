; DESCRIPTION: Places a purple 60x92 rectangle at position (374, 106).
; PLAN: r0=374(x), r1=106(y), r2=60(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 106
LDI r2, 60
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
