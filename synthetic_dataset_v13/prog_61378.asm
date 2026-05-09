; DESCRIPTION: Composite: Renders a magenta disk with center (344, 89) and radius 75 then Renders a yellow box of size 120x112 starting at (129, 128) then Sets a single orange pixel at (300, 198).
; PLAN: r0=344(x), r1=89(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=128(y), r7=120(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=300(x), r11=198(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 89
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 128
LDI r7, 120
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 198
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
