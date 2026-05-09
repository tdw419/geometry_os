; DESCRIPTION: Composite: Places a red circle of radius 72 at center (127, 161) then Renders a red box of size 65x37 starting at (65, 177) then Sets a single yellow pixel at (94, 213).
; PLAN: r0=127(x), r1=161(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=177(y), r7=65(width), r8=37(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=94(x), r11=213(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 127
LDI r1, 161
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 177
LDI r7, 65
LDI r8, 37
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 94
LDI r11, 213
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
