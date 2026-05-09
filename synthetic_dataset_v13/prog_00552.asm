; DESCRIPTION: Renders a yellow box of size 11x15 starting at (422, 240).
; PLAN: r0=422(x), r1=240(y), r2=11(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 240
LDI r2, 11
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
