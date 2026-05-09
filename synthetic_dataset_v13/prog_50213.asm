; DESCRIPTION: Composite: Sets a single green pixel at (59, 167) then Renders a cyan line between points (198, 124) and (18, 209).
; PLAN: r0=59(x), r1=167(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=198(x1), r6=124(y1), r7=18(x2), r8=209(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 167
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 198
LDI r6, 124
LDI r7, 18
LDI r8, 209
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
