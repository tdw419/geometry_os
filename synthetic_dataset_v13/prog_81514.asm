; DESCRIPTION: Renders a purple box of size 113x45 starting at (245, 96).
; PLAN: r0=245(x), r1=96(y), r2=113(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 96
LDI r2, 113
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
