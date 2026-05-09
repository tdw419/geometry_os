; DESCRIPTION: Renders a black box of size 54x45 starting at (347, 27).
; PLAN: r0=347(x), r1=27(y), r2=54(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 27
LDI r2, 54
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
