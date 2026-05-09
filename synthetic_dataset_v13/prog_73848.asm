; DESCRIPTION: Composite: Places a yellow dot at position (483, 224) then Draws a green line from (63, 67) to (50, 130).
; PLAN: r0=483(x), r1=224(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=63(x1), r6=67(y1), r7=50(x2), r8=130(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 224
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 63
LDI r6, 67
LDI r7, 50
LDI r8, 130
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
