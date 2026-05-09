; DESCRIPTION: Composite: Sets a single white pixel at (498, 228) then Places a blue line segment connecting (350, 238) to (176, 31) then Renders a cyan disk with center (213, 117) and radius 34.
; PLAN: r0=498(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=350(x1), r6=238(y1), r7=176(x2), r8=31(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=117(y), r12=34(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 498
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 238
LDI r7, 176
LDI r8, 31
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 117
LDI r12, 34
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
