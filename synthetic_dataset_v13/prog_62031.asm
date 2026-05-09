; DESCRIPTION: Composite: Places a purple dot at position (47, 220) then Renders a green box of size 97x94 starting at (196, 0).
; PLAN: r0=47(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=0(y), r7=97(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 0
LDI r7, 97
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
