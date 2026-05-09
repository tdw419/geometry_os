; DESCRIPTION: Renders a purple box of size 29x32 starting at (367, 131).
; PLAN: r0=367(x), r1=131(y), r2=29(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 131
LDI r2, 29
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
