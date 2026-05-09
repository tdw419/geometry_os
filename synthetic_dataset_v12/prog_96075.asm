; DESCRIPTION: Composite: Renders a purple disk with center (79, 67) and radius 65 then Renders a purple box of size 93x57 starting at (83, 138).
; PLAN: r0=79(x), r1=67(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=138(y), r7=93(width), r8=57(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 67
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 138
LDI r7, 93
LDI r8, 57
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
