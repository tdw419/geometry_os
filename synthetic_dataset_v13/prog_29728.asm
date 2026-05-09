; DESCRIPTION: Composite: Places a red dot at position (188, 169) then Places a yellow line segment connecting (391, 98) to (346, 193).
; PLAN: r0=188(x), r1=169(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=98(y1), r7=346(x2), r8=193(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 169
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 98
LDI r7, 346
LDI r8, 193
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
