; DESCRIPTION: Composite: Sets a single black pixel at (370, 53) then Renders a purple box of size 91x53 starting at (194, 71).
; PLAN: r0=370(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=71(y), r7=91(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 194
LDI r6, 71
LDI r7, 91
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
