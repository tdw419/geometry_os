; DESCRIPTION: Composite: Sets a single cyan pixel at (465, 24) then Renders a purple box of size 49x69 starting at (251, 158).
; PLAN: r0=465(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=158(y), r7=49(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 465
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 251
LDI r6, 158
LDI r7, 49
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
