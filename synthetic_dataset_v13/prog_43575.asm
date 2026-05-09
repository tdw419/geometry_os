; DESCRIPTION: Renders a yellow box of size 21x33 starting at (287, 221).
; PLAN: r0=287(x), r1=221(y), r2=21(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 221
LDI r2, 21
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
