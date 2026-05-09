; DESCRIPTION: Composite: Renders a magenta line between points (431, 107) and (242, 65) then Places a blue dot at position (230, 63) then Renders a cyan disk with center (98, 131) and radius 39.
; PLAN: r0=431(x1), r1=107(y1), r2=242(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=63(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=98(x), r11=131(y), r12=39(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 431
LDI r1, 107
LDI r2, 242
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 63
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 98
LDI r11, 131
LDI r12, 39
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
