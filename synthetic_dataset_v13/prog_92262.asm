; DESCRIPTION: Composite: Draws a black line from (439, 217) to (399, 149) then Renders a magenta disk with center (263, 146) and radius 18.
; PLAN: r0=439(x1), r1=217(y1), r2=399(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=146(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 439
LDI r1, 217
LDI r2, 399
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 146
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
