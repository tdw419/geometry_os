; DESCRIPTION: Composite: Renders a yellow line between points (90, 42) and (504, 108) then Sets a single green pixel at (62, 87).
; PLAN: r0=90(x1), r1=42(y1), r2=504(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=87(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 42
LDI r2, 504
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 87
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
