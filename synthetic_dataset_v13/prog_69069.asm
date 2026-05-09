; DESCRIPTION: Composite: Places a purple dot at position (312, 171) then Renders a yellow box of size 62x25 starting at (226, 188).
; PLAN: r0=312(x), r1=171(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=226(x), r6=188(y), r7=62(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 171
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 226
LDI r6, 188
LDI r7, 62
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
