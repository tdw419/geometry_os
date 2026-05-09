; DESCRIPTION: Composite: Places a blue dot at position (338, 28) then Renders a magenta line between points (167, 226) and (349, 73).
; PLAN: r0=338(x), r1=28(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=226(y1), r7=349(x2), r8=73(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 28
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 226
LDI r7, 349
LDI r8, 73
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
