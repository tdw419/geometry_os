; DESCRIPTION: Renders a purple box of size 105x32 starting at (363, 173).
; PLAN: r0=363(x), r1=173(y), r2=105(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 173
LDI r2, 105
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
