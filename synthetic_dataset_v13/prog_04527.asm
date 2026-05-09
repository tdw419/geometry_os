; DESCRIPTION: Renders a purple box of size 76x50 starting at (271, 112).
; PLAN: r0=271(x), r1=112(y), r2=76(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 112
LDI r2, 76
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
