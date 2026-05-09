; DESCRIPTION: Composite: Sets a single black pixel at (498, 59) then Places a magenta line segment connecting (386, 126) to (446, 230).
; PLAN: r0=498(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=386(x1), r6=126(y1), r7=446(x2), r8=230(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 498
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 386
LDI r6, 126
LDI r7, 446
LDI r8, 230
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
