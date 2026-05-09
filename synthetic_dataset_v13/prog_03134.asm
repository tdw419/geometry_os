; DESCRIPTION: Composite: Places a cyan dot at position (463, 237) then Renders a purple box of size 43x94 starting at (265, 25) then Places a yellow line segment connecting (343, 171) to (298, 140).
; PLAN: r0=463(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=25(y), r7=43(width), r8=94(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x1), r11=171(y1), r12=298(x2), r13=140(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 463
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 25
LDI r7, 43
LDI r8, 94
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 171
LDI r12, 298
LDI r13, 140
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
