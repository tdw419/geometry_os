; DESCRIPTION: Composite: Creates a cyan circular shape at (144, 51) with radius 44 then Draws a green line from (273, 219) to (315, 204) then Sets a single cyan pixel at (428, 243).
; PLAN: r0=144(x), r1=51(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x1), r6=219(y1), r7=315(x2), r8=204(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=243(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 51
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 219
LDI r7, 315
LDI r8, 204
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 243
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
