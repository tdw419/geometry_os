; DESCRIPTION: Composite: Creates a purple circular shape at (273, 206) with radius 39 then Renders a magenta line between points (128, 242) and (258, 87) then Places a yellow dot at position (410, 15).
; PLAN: r0=273(x), r1=206(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x1), r6=242(y1), r7=258(x2), r8=87(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=15(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 206
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 242
LDI r7, 258
LDI r8, 87
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 15
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
