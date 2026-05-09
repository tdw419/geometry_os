; DESCRIPTION: Composite: Places a purple dot at position (275, 165) then Renders a yellow box of size 93x99 starting at (119, 9).
; PLAN: r0=275(x), r1=165(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=9(y), r7=93(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 165
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 9
LDI r7, 93
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
