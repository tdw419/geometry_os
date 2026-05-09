; DESCRIPTION: Composite: Renders a white line between points (290, 209) and (2, 147) then Places a magenta circle of radius 51 at center (382, 135) then Places a yellow dot at position (146, 5).
; PLAN: r0=290(x1), r1=209(y1), r2=2(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=382(x), r6=135(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=5(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 209
LDI r2, 2
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 135
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 5
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
