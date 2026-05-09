; DESCRIPTION: Composite: Renders a cyan line between points (114, 13) and (295, 85) then Places a blue circle of radius 63 at center (211, 135).
; PLAN: r0=114(x1), r1=13(y1), r2=295(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=135(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 13
LDI r2, 295
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 135
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
