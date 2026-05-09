; DESCRIPTION: Composite: Sets a single cyan pixel at (126, 161) then Renders a green box of size 117x94 starting at (339, 96).
; PLAN: r0=126(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=96(y), r7=117(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 96
LDI r7, 117
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
