; DESCRIPTION: Renders a yellow box of size 111x49 starting at (283, 126).
; PLAN: r0=283(x), r1=126(y), r2=111(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 126
LDI r2, 111
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
