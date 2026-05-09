; DESCRIPTION: Renders a black box of size 60x52 starting at (275, 60).
; PLAN: r0=275(x), r1=60(y), r2=60(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 60
LDI r2, 60
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
