; DESCRIPTION: Composite: Renders a yellow box of size 50x46 starting at (318, 150) then Sets a single magenta pixel at (138, 142).
; PLAN: r0=318(x), r1=150(y), r2=50(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=142(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 150
LDI r2, 50
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 142
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
