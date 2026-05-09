; DESCRIPTION: Places a purple 53x74 rectangle at position (177, 173).
; PLAN: r0=177(x), r1=173(y), r2=53(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 173
LDI r2, 53
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
