; DESCRIPTION: Composite: Renders a magenta disk with center (415, 150) and radius 61 then Places a black line segment connecting (197, 107) to (10, 146) then Places a red dot at position (104, 158).
; PLAN: r0=415(x), r1=150(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=107(y1), r7=10(x2), r8=146(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=104(x), r11=158(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 415
LDI r1, 150
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 107
LDI r7, 10
LDI r8, 146
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 158
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
