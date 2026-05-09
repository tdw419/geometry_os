; DESCRIPTION: Renders a purple box of size 52x29 starting at (365, 173).
; PLAN: r0=365(x), r1=173(y), r2=52(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 173
LDI r2, 52
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
