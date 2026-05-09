; DESCRIPTION: Composite: Places a purple dot at position (241, 103) then Renders a yellow box of size 88x35 starting at (29, 82).
; PLAN: r0=241(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=82(y), r7=88(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 29
LDI r6, 82
LDI r7, 88
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
