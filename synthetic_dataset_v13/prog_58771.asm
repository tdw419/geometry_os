; DESCRIPTION: Renders a purple box of size 58x45 starting at (193, 47).
; PLAN: r0=193(x), r1=47(y), r2=58(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 47
LDI r2, 58
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
