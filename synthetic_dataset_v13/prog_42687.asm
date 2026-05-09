; DESCRIPTION: Composite: Draws a green circle centered at (165, 120) with radius 42 then Renders a purple line between points (337, 206) and (95, 154) then Sets a single cyan pixel at (320, 17).
; PLAN: r0=165(x), r1=120(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x1), r6=206(y1), r7=95(x2), r8=154(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=17(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 120
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 206
LDI r7, 95
LDI r8, 154
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 17
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
