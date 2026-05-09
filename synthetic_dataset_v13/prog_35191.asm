; DESCRIPTION: Composite: Renders a purple box of size 54x94 starting at (188, 47) then Sets a single magenta pixel at (68, 151).
; PLAN: r0=188(x), r1=47(y), r2=54(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=151(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 47
LDI r2, 54
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 151
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
