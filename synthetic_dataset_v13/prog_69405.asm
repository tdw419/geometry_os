; DESCRIPTION: Composite: Sets a single purple pixel at (168, 18) then Renders a cyan box of size 98x78 starting at (314, 119).
; PLAN: r0=168(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=314(x), r6=119(y), r7=98(width), r8=78(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 314
LDI r6, 119
LDI r7, 98
LDI r8, 78
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
