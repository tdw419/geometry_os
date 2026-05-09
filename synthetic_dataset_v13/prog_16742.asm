; DESCRIPTION: Places a purple 43x111 rectangle at position (77, 32).
; PLAN: r0=77(x), r1=32(y), r2=43(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 32
LDI r2, 43
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
