; DESCRIPTION: Renders a purple box of size 53x79 starting at (422, 55).
; PLAN: r0=422(x), r1=55(y), r2=53(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 55
LDI r2, 53
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
