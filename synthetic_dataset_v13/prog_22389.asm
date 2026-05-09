; DESCRIPTION: Composite: Renders a green box of size 90x57 starting at (324, 31) then Places a blue dot at position (377, 92).
; PLAN: r0=324(x), r1=31(y), r2=90(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=92(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 31
LDI r2, 90
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 92
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
