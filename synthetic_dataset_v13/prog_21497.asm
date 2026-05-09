; DESCRIPTION: Composite: Draws a magenta line from (194, 169) to (228, 243) then Sets a single cyan pixel at (487, 253) then Creates a yellow rectangular region at (204, 211) spanning 73 by 17 pixels.
; PLAN: r0=194(x1), r1=169(y1), r2=228(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=253(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=204(x), r11=211(y), r12=73(width), r13=17(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 169
LDI r2, 228
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 253
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 204
LDI r11, 211
LDI r12, 73
LDI r13, 17
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
