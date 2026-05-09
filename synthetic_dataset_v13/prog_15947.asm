; DESCRIPTION: Composite: Renders a blue line between points (39, 23) and (168, 237) then Renders a white disk with center (419, 119) and radius 65 then Places a blue dot at position (117, 73).
; PLAN: r0=39(x1), r1=23(y1), r2=168(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=419(x), r6=119(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=73(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 39
LDI r1, 23
LDI r2, 168
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 119
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 73
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
