; DESCRIPTION: Composite: Draws a purple line from (21, 44) to (215, 192) then Sets a single cyan pixel at (503, 133).
; PLAN: r0=21(x1), r1=44(y1), r2=215(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=503(x), r6=133(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 44
LDI r2, 215
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 133
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
