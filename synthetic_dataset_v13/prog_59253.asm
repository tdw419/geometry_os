; DESCRIPTION: Renders a purple box of size 31x46 starting at (449, 143).
; PLAN: r0=449(x), r1=143(y), r2=31(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 143
LDI r2, 31
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
