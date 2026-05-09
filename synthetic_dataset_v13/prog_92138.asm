; DESCRIPTION: Composite: Places a yellow line segment connecting (340, 154) to (356, 243) then Sets a single blue pixel at (126, 223).
; PLAN: r0=340(x1), r1=154(y1), r2=356(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=223(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 154
LDI r2, 356
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 223
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
