; DESCRIPTION: Composite: Renders a yellow line between points (272, 222) and (202, 11) then Places a red dot at position (242, 145).
; PLAN: r0=272(x1), r1=222(y1), r2=202(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=145(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 222
LDI r2, 202
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 145
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
