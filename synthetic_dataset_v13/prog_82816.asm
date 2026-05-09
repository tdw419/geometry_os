; DESCRIPTION: Composite: Renders a purple box of size 23x104 starting at (446, 109) then Places a yellow dot at position (205, 27).
; PLAN: r0=446(x), r1=109(y), r2=23(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=27(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 446
LDI r1, 109
LDI r2, 23
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 27
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
