; DESCRIPTION: Renders a purple box of size 53x40 starting at (295, 39).
; PLAN: r0=295(x), r1=39(y), r2=53(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 39
LDI r2, 53
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
