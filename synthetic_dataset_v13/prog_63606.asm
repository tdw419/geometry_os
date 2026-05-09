; DESCRIPTION: Renders a black box of size 45x40 starting at (422, 87).
; PLAN: r0=422(x), r1=87(y), r2=45(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 87
LDI r2, 45
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
