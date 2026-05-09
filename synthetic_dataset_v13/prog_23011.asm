; DESCRIPTION: Composite: Places a purple dot at position (388, 90) then Renders a purple box of size 92x41 starting at (187, 37).
; PLAN: r0=388(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=37(y), r7=92(width), r8=41(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 90
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 37
LDI r7, 92
LDI r8, 41
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
