; DESCRIPTION: Renders a green box of size 106x36 starting at (285, 38).
; PLAN: r0=285(x), r1=38(y), r2=106(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 38
LDI r2, 106
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
