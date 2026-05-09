; DESCRIPTION: Places a purple 32x45 rectangle at position (241, 17).
; PLAN: r0=241(x), r1=17(y), r2=32(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 17
LDI r2, 32
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
