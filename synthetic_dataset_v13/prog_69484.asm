; DESCRIPTION: Composite: Renders a cyan line between points (461, 202) and (136, 214) then Creates a red circular shape at (155, 194) with radius 40 then Places a magenta dot at position (146, 27).
; PLAN: r0=461(x1), r1=202(y1), r2=136(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=194(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=27(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 461
LDI r1, 202
LDI r2, 136
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 194
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 27
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
