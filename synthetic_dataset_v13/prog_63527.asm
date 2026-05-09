; DESCRIPTION: Places a cyan line segment connecting (48, 189) to (373, 192).
; PLAN: r0=48(x1), r1=189(y1), r2=373(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 189
LDI r2, 373
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
