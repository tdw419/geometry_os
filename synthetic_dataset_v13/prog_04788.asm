; DESCRIPTION: Renders a yellow box of size 52x40 starting at (180, 183).
; PLAN: r0=180(x), r1=183(y), r2=52(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 183
LDI r2, 52
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
