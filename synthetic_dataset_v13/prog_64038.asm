; DESCRIPTION: Composite: Places a yellow dot at position (483, 130) then Draws a black line from (64, 59) to (86, 150).
; PLAN: r0=483(x), r1=130(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=64(x1), r6=59(y1), r7=86(x2), r8=150(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 130
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 64
LDI r6, 59
LDI r7, 86
LDI r8, 150
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
