; DESCRIPTION: Places a purple 111x44 rectangle at position (241, 190).
; PLAN: r0=241(x), r1=190(y), r2=111(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 190
LDI r2, 111
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
