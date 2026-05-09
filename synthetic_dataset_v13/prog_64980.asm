; DESCRIPTION: Composite: Places a magenta line segment connecting (426, 21) to (283, 57) then Places a magenta dot at position (265, 27) then Places a green circle of radius 18 at center (206, 65).
; PLAN: r0=426(x1), r1=21(y1), r2=283(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=27(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x), r11=65(y), r12=18(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 426
LDI r1, 21
LDI r2, 283
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 27
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 65
LDI r12, 18
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
