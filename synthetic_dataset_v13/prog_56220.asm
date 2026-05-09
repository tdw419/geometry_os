; DESCRIPTION: Composite: Renders a yellow box of size 46x33 starting at (437, 36) then Sets a single magenta pixel at (54, 49).
; PLAN: r0=437(x), r1=36(y), r2=46(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=49(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 36
LDI r2, 46
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 49
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
