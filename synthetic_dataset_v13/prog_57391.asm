; DESCRIPTION: Composite: Places a purple circle of radius 56 at center (401, 149) then Places a purple dot at position (35, 127).
; PLAN: r0=401(x), r1=149(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=127(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 149
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 127
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
