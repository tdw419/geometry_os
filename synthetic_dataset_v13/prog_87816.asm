; DESCRIPTION: Renders a purple line between points (269, 239) and (256, 192).
; PLAN: r0=269(x1), r1=239(y1), r2=256(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 239
LDI r2, 256
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
