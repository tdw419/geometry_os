; DESCRIPTION: Renders a green line between points (426, 98) and (263, 248).
; PLAN: r0=426(x1), r1=98(y1), r2=263(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 98
LDI r2, 263
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
