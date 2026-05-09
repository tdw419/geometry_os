; DESCRIPTION: Places a cyan line segment connecting (321, 237) to (506, 63).
; PLAN: r0=321(x1), r1=237(y1), r2=506(x2), r3=63(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 237
LDI r2, 506
LDI r3, 63
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
