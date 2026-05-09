; DESCRIPTION: Composite: Sets a single cyan pixel at (158, 213) then Creates a magenta circular shape at (156, 51) with radius 50 then Draws a green line from (430, 237) to (271, 216).
; PLAN: r0=158(x), r1=213(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=51(y), r7=50(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x1), r11=237(y1), r12=271(x2), r13=216(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 213
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 51
LDI r7, 50
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 237
LDI r12, 271
LDI r13, 216
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
