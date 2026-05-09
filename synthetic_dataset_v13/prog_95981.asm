; DESCRIPTION: Places a purple 50x15 rectangle at position (172, 15).
; PLAN: r0=172(x), r1=15(y), r2=50(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 15
LDI r2, 50
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
