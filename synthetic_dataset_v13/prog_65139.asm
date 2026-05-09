; DESCRIPTION: Composite: Places a red line segment connecting (475, 221) to (439, 236) then Renders a white disk with center (220, 64) and radius 60 then Places a orange dot at position (171, 101).
; PLAN: r0=475(x1), r1=221(y1), r2=439(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=64(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=171(x), r11=101(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 221
LDI r2, 439
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 64
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 171
LDI r11, 101
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
