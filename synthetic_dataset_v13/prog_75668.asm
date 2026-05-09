; DESCRIPTION: Places a purple 112x60 rectangle at position (269, 43).
; PLAN: r0=269(x), r1=43(y), r2=112(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 43
LDI r2, 112
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
