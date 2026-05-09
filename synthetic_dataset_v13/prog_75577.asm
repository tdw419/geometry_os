; DESCRIPTION: Renders a purple box of size 111x70 starting at (173, 101).
; PLAN: r0=173(x), r1=101(y), r2=111(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 101
LDI r2, 111
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
