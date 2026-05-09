; DESCRIPTION: Composite: Renders a cyan disk with center (371, 127) and radius 24 then Places a cyan dot at position (259, 170) then Renders a white line between points (345, 63) and (314, 96).
; PLAN: r0=371(x), r1=127(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=170(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=345(x1), r11=63(y1), r12=314(x2), r13=96(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 127
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 170
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 63
LDI r12, 314
LDI r13, 96
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
