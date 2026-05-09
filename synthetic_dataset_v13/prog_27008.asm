; DESCRIPTION: Renders a black box of size 39x44 starting at (347, 63).
; PLAN: r0=347(x), r1=63(y), r2=39(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 63
LDI r2, 39
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
