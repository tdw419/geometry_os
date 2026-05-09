; DESCRIPTION: Renders a yellow box of size 57x33 starting at (71, 193).
; PLAN: r0=71(x), r1=193(y), r2=57(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 193
LDI r2, 57
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
