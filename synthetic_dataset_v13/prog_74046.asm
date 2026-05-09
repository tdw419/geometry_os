; DESCRIPTION: Composite: Places a blue dot at position (488, 52) then Draws a green circle centered at (48, 185) with radius 44 then Places a cyan line segment connecting (231, 230) to (189, 180).
; PLAN: r0=488(x), r1=52(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=185(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x1), r11=230(y1), r12=189(x2), r13=180(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 488
LDI r1, 52
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 48
LDI r6, 185
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 230
LDI r12, 189
LDI r13, 180
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
