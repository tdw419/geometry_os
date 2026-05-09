; DESCRIPTION: Composite: Sets a single purple pixel at (34, 98) then Renders a green box of size 22x27 starting at (27, 172).
; PLAN: r0=34(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=27(x), r6=172(y), r7=22(width), r8=27(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 27
LDI r6, 172
LDI r7, 22
LDI r8, 27
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
