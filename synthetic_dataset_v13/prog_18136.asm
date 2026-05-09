; DESCRIPTION: Composite: Places a cyan dot at position (321, 247) then Renders a white disk with center (309, 226) and radius 11 then Draws a green line from (183, 23) to (400, 157).
; PLAN: r0=321(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=226(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x1), r11=23(y1), r12=400(x2), r13=157(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 226
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 23
LDI r12, 400
LDI r13, 157
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
