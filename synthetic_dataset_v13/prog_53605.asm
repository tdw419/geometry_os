; DESCRIPTION: Composite: Creates a yellow circular shape at (124, 107) with radius 73 then Draws a cyan line from (70, 70) to (102, 159) then Sets a single white pixel at (360, 209).
; PLAN: r0=124(x), r1=107(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x1), r6=70(y1), r7=102(x2), r8=159(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=209(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 107
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 70
LDI r7, 102
LDI r8, 159
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 209
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
