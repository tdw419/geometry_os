; DESCRIPTION: Composite: Creates a yellow circular shape at (406, 81) with radius 65 then Places a cyan dot at position (106, 220) then Places a magenta line segment connecting (128, 120) to (240, 108).
; PLAN: r0=406(x), r1=81(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=128(x1), r11=120(y1), r12=240(x2), r13=108(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 81
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 120
LDI r12, 240
LDI r13, 108
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
