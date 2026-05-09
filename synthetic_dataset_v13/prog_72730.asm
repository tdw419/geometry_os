; DESCRIPTION: Composite: Sets a single orange pixel at (366, 175) then Renders a magenta line between points (401, 184) and (349, 225).
; PLAN: r0=366(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=184(y1), r7=349(x2), r8=225(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 401
LDI r6, 184
LDI r7, 349
LDI r8, 225
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
