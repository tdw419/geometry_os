; DESCRIPTION: Places a purple 24x102 rectangle at position (441, 139).
; PLAN: r0=441(x), r1=139(y), r2=24(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 139
LDI r2, 24
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
