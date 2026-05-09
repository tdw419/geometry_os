; DESCRIPTION: Composite: Places a green dot at position (170, 233) then Renders a purple box of size 60x23 starting at (95, 71).
; PLAN: r0=170(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=95(x), r6=71(y), r7=60(width), r8=23(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 170
LDI r1, 233
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 95
LDI r6, 71
LDI r7, 60
LDI r8, 23
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
