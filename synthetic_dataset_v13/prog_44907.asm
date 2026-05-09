; DESCRIPTION: Renders a purple box of size 21x55 starting at (313, 109).
; PLAN: r0=313(x), r1=109(y), r2=21(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 109
LDI r2, 21
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
