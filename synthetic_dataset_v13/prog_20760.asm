; DESCRIPTION: Composite: Sets a single black pixel at (98, 23) then Renders a green box of size 50x25 starting at (4, 124).
; PLAN: r0=98(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=4(x), r6=124(y), r7=50(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 4
LDI r6, 124
LDI r7, 50
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
