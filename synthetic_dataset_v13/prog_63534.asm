; DESCRIPTION: Places a purple 24x111 rectangle at position (330, 139).
; PLAN: r0=330(x), r1=139(y), r2=24(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 139
LDI r2, 24
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
