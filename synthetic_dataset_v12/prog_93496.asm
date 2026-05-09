; DESCRIPTION: Places a purple 111x20 rectangle at position (100, 144).
; PLAN: r0=100(x), r1=144(y), r2=111(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 144
LDI r2, 111
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
