; DESCRIPTION: Composite: Places a purple line segment connecting (34, 226) to (426, 193) then Sets a single cyan pixel at (503, 215).
; PLAN: r0=34(x1), r1=226(y1), r2=426(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=503(x), r6=215(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 226
LDI r2, 426
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 503
LDI r6, 215
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
