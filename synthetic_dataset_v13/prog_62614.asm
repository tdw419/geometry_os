; DESCRIPTION: Composite: Draws a cyan circle centered at (46, 163) with radius 29 then Sets a single magenta pixel at (387, 206).
; PLAN: r0=46(x), r1=163(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=206(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 163
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 206
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
