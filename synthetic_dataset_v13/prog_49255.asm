; DESCRIPTION: Composite: Draws a yellow circle centered at (353, 161) with radius 46 then Places a magenta dot at position (395, 133).
; PLAN: r0=353(x), r1=161(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=133(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 161
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 133
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
