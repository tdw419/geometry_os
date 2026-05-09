; DESCRIPTION: Composite: Places a cyan dot at position (226, 57) then Places a black line segment connecting (202, 54) to (20, 114).
; PLAN: r0=226(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=202(x1), r6=54(y1), r7=20(x2), r8=114(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 54
LDI r7, 20
LDI r8, 114
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
