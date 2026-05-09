; DESCRIPTION: Composite: Places a green line segment connecting (133, 249) to (488, 70) then Renders a cyan disk with center (75, 59) and radius 22 then Places a red dot at position (233, 245).
; PLAN: r0=133(x1), r1=249(y1), r2=488(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=59(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x), r11=245(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 133
LDI r1, 249
LDI r2, 488
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 59
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 245
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
