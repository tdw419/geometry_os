; DESCRIPTION: Composite: Places a green dot at position (36, 103) then Renders a purple box of size 105x94 starting at (315, 46).
; PLAN: r0=36(x), r1=103(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=46(y), r7=105(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 103
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 315
LDI r6, 46
LDI r7, 105
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
