; DESCRIPTION: Renders a yellow box of size 111x33 starting at (216, 221).
; PLAN: r0=216(x), r1=221(y), r2=111(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 221
LDI r2, 111
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
