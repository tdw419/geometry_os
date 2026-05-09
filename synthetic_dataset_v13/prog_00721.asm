; DESCRIPTION: Composite: Renders a yellow line between points (370, 228) and (412, 165) then Creates a cyan rectangular region at (86, 17) spanning 20 by 56 pixels then Sets a single magenta pixel at (229, 228).
; PLAN: r0=370(x1), r1=228(y1), r2=412(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=17(y), r7=20(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=228(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 370
LDI r1, 228
LDI r2, 412
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 17
LDI r7, 20
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 228
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
