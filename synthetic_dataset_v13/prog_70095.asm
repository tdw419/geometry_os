; DESCRIPTION: Composite: Sets a single black pixel at (263, 95) then Places a black line segment connecting (502, 243) to (341, 255).
; PLAN: r0=263(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=243(y1), r7=341(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 502
LDI r6, 243
LDI r7, 341
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
