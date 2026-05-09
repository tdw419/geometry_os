; DESCRIPTION: Composite: Places a green dot at position (436, 148) then Draws a magenta line from (157, 130) to (273, 106).
; PLAN: r0=436(x), r1=148(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=157(x1), r6=130(y1), r7=273(x2), r8=106(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 436
LDI r1, 148
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 157
LDI r6, 130
LDI r7, 273
LDI r8, 106
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
