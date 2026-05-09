; DESCRIPTION: Composite: Creates a magenta circular shape at (294, 179) with radius 48 then Sets a single yellow pixel at (213, 48) then Draws a white line from (415, 209) to (122, 176).
; PLAN: r0=294(x), r1=179(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=48(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=415(x1), r11=209(y1), r12=122(x2), r13=176(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 294
LDI r1, 179
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 48
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 415
LDI r11, 209
LDI r12, 122
LDI r13, 176
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
