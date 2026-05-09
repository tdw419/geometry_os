; DESCRIPTION: Composite: Sets a single black pixel at (475, 165) then Renders a purple box of size 39x70 starting at (432, 132).
; PLAN: r0=475(x), r1=165(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=432(x), r6=132(y), r7=39(width), r8=70(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 165
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 432
LDI r6, 132
LDI r7, 39
LDI r8, 70
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
