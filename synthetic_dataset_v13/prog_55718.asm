; DESCRIPTION: Renders a purple box of size 55x45 starting at (78, 91).
; PLAN: r0=78(x), r1=91(y), r2=55(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 91
LDI r2, 55
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
