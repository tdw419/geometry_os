; DESCRIPTION: Renders a yellow line between points (321, 239) and (174, 48).
; PLAN: r0=321(x1), r1=239(y1), r2=174(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 239
LDI r2, 174
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
