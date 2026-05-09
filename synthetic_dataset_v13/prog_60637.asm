; DESCRIPTION: Composite: Renders a red box of size 115x118 starting at (283, 67) then Places a purple dot at position (345, 94).
; PLAN: r0=283(x), r1=67(y), r2=115(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=94(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 283
LDI r1, 67
LDI r2, 115
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 94
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
