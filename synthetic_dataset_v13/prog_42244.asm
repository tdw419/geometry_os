; DESCRIPTION: Composite: Draws a yellow line from (291, 43) to (440, 226) then Sets a single magenta pixel at (224, 169).
; PLAN: r0=291(x1), r1=43(y1), r2=440(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=169(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 43
LDI r2, 440
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 169
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
