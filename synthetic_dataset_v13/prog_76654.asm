; DESCRIPTION: Composite: Renders a green disk with center (242, 239) and radius 11 then Sets a single red pixel at (467, 39) then Places a green line segment connecting (363, 47) to (255, 226).
; PLAN: r0=242(x), r1=239(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=467(x), r6=39(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=363(x1), r11=47(y1), r12=255(x2), r13=226(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 239
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 467
LDI r6, 39
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 363
LDI r11, 47
LDI r12, 255
LDI r13, 226
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
