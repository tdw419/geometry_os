; DESCRIPTION: Renders a purple box of size 50x119 starting at (401, 27).
; PLAN: r0=401(x), r1=27(y), r2=50(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 27
LDI r2, 50
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
