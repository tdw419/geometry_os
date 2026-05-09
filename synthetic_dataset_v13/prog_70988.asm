; DESCRIPTION: Composite: Creates a red circular shape at (161, 149) with radius 71 then Places a blue dot at position (302, 190).
; PLAN: r0=161(x), r1=149(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=302(x), r6=190(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 149
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 302
LDI r6, 190
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
