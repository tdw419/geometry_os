; DESCRIPTION: Renders a purple box of size 96x26 starting at (50, 173).
; PLAN: r0=50(x), r1=173(y), r2=96(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 173
LDI r2, 96
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
