; DESCRIPTION: Composite: Sets a single yellow pixel at (418, 19) then Renders a magenta line between points (401, 93) and (44, 115) then Renders a cyan disk with center (120, 57) and radius 18.
; PLAN: r0=418(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=93(y1), r7=44(x2), r8=115(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=120(x), r11=57(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 401
LDI r6, 93
LDI r7, 44
LDI r8, 115
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 57
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
