; DESCRIPTION: Renders a purple box of size 38x56 starting at (304, 139).
; PLAN: r0=304(x), r1=139(y), r2=38(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 139
LDI r2, 38
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
