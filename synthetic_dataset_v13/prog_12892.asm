; DESCRIPTION: Composite: Renders a white line between points (295, 134) and (269, 217) then Sets a single green pixel at (146, 46).
; PLAN: r0=295(x1), r1=134(y1), r2=269(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=46(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 295
LDI r1, 134
LDI r2, 269
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 46
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
