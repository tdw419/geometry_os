; DESCRIPTION: Composite: Renders a cyan line between points (256, 188) and (65, 195) then Sets a single blue pixel at (372, 198).
; PLAN: r0=256(x1), r1=188(y1), r2=65(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=198(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 256
LDI r1, 188
LDI r2, 65
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 198
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
