; DESCRIPTION: Composite: Renders a magenta line between points (383, 152) and (48, 222) then Sets a single cyan pixel at (149, 176).
; PLAN: r0=383(x1), r1=152(y1), r2=48(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=176(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 152
LDI r2, 48
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 176
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
