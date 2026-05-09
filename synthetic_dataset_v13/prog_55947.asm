; DESCRIPTION: Composite: Renders a orange disk with center (289, 111) and radius 41 then Renders a yellow box of size 70x51 starting at (223, 26) then Sets a single purple pixel at (146, 246).
; PLAN: r0=289(x), r1=111(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=26(y), r7=70(width), r8=51(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=246(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 111
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 26
LDI r7, 70
LDI r8, 51
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 246
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
