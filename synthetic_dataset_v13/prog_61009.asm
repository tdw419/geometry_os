; DESCRIPTION: Composite: Renders a red line between points (4, 41) and (425, 95) then Creates a red circular shape at (318, 117) with radius 60 then Places a magenta dot at position (113, 146).
; PLAN: r0=4(x1), r1=41(y1), r2=425(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=117(y), r7=60(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=113(x), r11=146(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 4
LDI r1, 41
LDI r2, 425
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 117
LDI r7, 60
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 113
LDI r11, 146
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
