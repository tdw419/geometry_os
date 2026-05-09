; DESCRIPTION: Renders a white line between points (494, 218) and (310, 213).
; PLAN: r0=494(x1), r1=218(y1), r2=310(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 218
LDI r2, 310
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
