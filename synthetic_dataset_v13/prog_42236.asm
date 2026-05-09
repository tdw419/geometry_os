; DESCRIPTION: Renders a purple box of size 31x120 starting at (173, 2).
; PLAN: r0=173(x), r1=2(y), r2=31(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 2
LDI r2, 31
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
