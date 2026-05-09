; DESCRIPTION: Composite: Draws a yellow line from (116, 115) to (270, 92) then Renders a cyan disk with center (450, 76) and radius 47.
; PLAN: r0=116(x1), r1=115(y1), r2=270(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=76(y), r7=47(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 115
LDI r2, 270
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 76
LDI r7, 47
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
