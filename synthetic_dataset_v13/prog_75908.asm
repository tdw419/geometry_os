; DESCRIPTION: Places a purple 106x32 rectangle at position (194, 204).
; PLAN: r0=194(x), r1=204(y), r2=106(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 204
LDI r2, 106
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
