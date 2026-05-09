; DESCRIPTION: Composite: Renders a blue line between points (98, 113) and (243, 180) then Renders a cyan disk with center (246, 124) and radius 53 then Sets a single purple pixel at (25, 166).
; PLAN: r0=98(x1), r1=113(y1), r2=243(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=124(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=25(x), r11=166(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 113
LDI r2, 243
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 124
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 25
LDI r11, 166
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
