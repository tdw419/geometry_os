; DESCRIPTION: Places a blue 111x73 rectangle at position (190, 144).
; PLAN: r0=190(x), r1=144(y), r2=111(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 144
LDI r2, 111
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
