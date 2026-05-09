; DESCRIPTION: Composite: Sets a single orange pixel at (243, 254) then Renders a blue line between points (275, 217) and (446, 71).
; PLAN: r0=243(x), r1=254(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=275(x1), r6=217(y1), r7=446(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 254
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 275
LDI r6, 217
LDI r7, 446
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
