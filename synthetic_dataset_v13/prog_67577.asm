; DESCRIPTION: Composite: Places a purple dot at position (59, 61) then Places a black line segment connecting (332, 154) to (1, 228).
; PLAN: r0=59(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=332(x1), r6=154(y1), r7=1(x2), r8=228(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 154
LDI r7, 1
LDI r8, 228
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
