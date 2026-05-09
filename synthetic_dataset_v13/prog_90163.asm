; DESCRIPTION: Renders a yellow box of size 94x99 starting at (317, 102).
; PLAN: r0=317(x), r1=102(y), r2=94(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 102
LDI r2, 94
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
