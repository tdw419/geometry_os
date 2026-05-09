; DESCRIPTION: Composite: Renders a cyan line between points (362, 157) and (356, 234) then Renders a cyan disk with center (286, 151) and radius 43 then Places a white dot at position (295, 145).
; PLAN: r0=362(x1), r1=157(y1), r2=356(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=151(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=295(x), r11=145(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 157
LDI r2, 356
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 151
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 295
LDI r11, 145
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
