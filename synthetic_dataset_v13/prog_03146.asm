; DESCRIPTION: Composite: Draws a magenta circle centered at (394, 152) with radius 72 then Places a cyan dot at position (463, 9) then Renders a purple line between points (426, 232) and (435, 46).
; PLAN: r0=394(x), r1=152(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=426(x1), r11=232(y1), r12=435(x2), r13=46(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 152
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 426
LDI r11, 232
LDI r12, 435
LDI r13, 46
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
