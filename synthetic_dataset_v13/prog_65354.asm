; DESCRIPTION: Composite: Renders a green disk with center (177, 202) and radius 30 then Draws a green line from (40, 12) to (504, 88) then Places a magenta dot at position (247, 250).
; PLAN: r0=177(x), r1=202(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x1), r6=12(y1), r7=504(x2), r8=88(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=250(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 177
LDI r1, 202
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 12
LDI r7, 504
LDI r8, 88
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 250
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
