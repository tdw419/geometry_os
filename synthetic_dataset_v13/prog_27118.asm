; DESCRIPTION: Composite: Draws a red line from (180, 150) to (208, 59) then Creates a yellow circular shape at (254, 207) with radius 34 then Sets a single cyan pixel at (238, 223).
; PLAN: r0=180(x1), r1=150(y1), r2=208(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=207(y), r7=34(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=238(x), r11=223(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 180
LDI r1, 150
LDI r2, 208
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 207
LDI r7, 34
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 238
LDI r11, 223
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
