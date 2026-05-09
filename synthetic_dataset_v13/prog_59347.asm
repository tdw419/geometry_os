; DESCRIPTION: Composite: Places a blue line segment connecting (498, 124) to (243, 35) then Draws a cyan circle centered at (267, 61) with radius 45 then Places a blue dot at position (305, 194).
; PLAN: r0=498(x1), r1=124(y1), r2=243(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=61(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=194(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 498
LDI r1, 124
LDI r2, 243
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 61
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 194
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
