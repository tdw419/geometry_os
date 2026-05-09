; DESCRIPTION: Renders a purple box of size 45x38 starting at (75, 208).
; PLAN: r0=75(x), r1=208(y), r2=45(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 208
LDI r2, 45
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
