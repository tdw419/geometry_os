; DESCRIPTION: Composite: Places a black line segment connecting (437, 71) to (65, 193) then Creates a cyan circular shape at (173, 151) with radius 72.
; PLAN: r0=437(x1), r1=71(y1), r2=65(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=173(x), r6=151(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 71
LDI r2, 65
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 151
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
