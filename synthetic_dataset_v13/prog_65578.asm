; DESCRIPTION: Composite: Draws a cyan circle centered at (106, 33) with radius 16 then Renders a red line between points (423, 244) and (450, 247) then Sets a single orange pixel at (362, 241).
; PLAN: r0=106(x), r1=33(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x1), r6=244(y1), r7=450(x2), r8=247(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=362(x), r11=241(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 33
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 244
LDI r7, 450
LDI r8, 247
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 362
LDI r11, 241
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
