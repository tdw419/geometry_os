; DESCRIPTION: Composite: Places a cyan dot at position (189, 147) then Places a blue line segment connecting (143, 228) to (383, 93) then Places a yellow circle of radius 40 at center (187, 213).
; PLAN: r0=189(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=143(x1), r6=228(y1), r7=383(x2), r8=93(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=213(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 143
LDI r6, 228
LDI r7, 383
LDI r8, 93
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 213
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
