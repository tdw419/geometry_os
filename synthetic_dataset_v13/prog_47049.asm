; DESCRIPTION: Composite: Renders a green line between points (79, 115) and (493, 212) then Creates a cyan circular shape at (255, 149) with radius 79.
; PLAN: r0=79(x1), r1=115(y1), r2=493(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=149(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 115
LDI r2, 493
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 149
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
