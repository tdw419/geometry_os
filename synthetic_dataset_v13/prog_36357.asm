; DESCRIPTION: Renders a cyan line between points (217, 208) and (414, 240).
; PLAN: r0=217(x1), r1=208(y1), r2=414(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 208
LDI r2, 414
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
