; DESCRIPTION: Composite: Renders a yellow box of size 114x61 starting at (138, 161) then Places a purple dot at position (315, 13).
; PLAN: r0=138(x), r1=161(y), r2=114(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=13(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 161
LDI r2, 114
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 13
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
