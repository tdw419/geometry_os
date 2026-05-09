; DESCRIPTION: Renders a purple box of size 50x81 starting at (425, 126).
; PLAN: r0=425(x), r1=126(y), r2=50(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 126
LDI r2, 50
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
