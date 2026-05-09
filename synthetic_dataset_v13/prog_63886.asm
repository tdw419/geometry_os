; DESCRIPTION: Composite: Sets a single blue pixel at (84, 19) then Renders a cyan line between points (342, 67) and (216, 57).
; PLAN: r0=84(x), r1=19(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=342(x1), r6=67(y1), r7=216(x2), r8=57(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 19
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 67
LDI r7, 216
LDI r8, 57
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
