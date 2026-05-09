; DESCRIPTION: Composite: Sets a single purple pixel at (221, 176) then Renders a green box of size 15x101 starting at (217, 46).
; PLAN: r0=221(x), r1=176(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=46(y), r7=15(width), r8=101(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 221
LDI r1, 176
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 46
LDI r7, 15
LDI r8, 101
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
