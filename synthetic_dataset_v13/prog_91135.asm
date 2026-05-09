; DESCRIPTION: Places a purple 39x31 rectangle at position (441, 190).
; PLAN: r0=441(x), r1=190(y), r2=39(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 190
LDI r2, 39
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
