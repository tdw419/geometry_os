; DESCRIPTION: Renders a green line between points (304, 111) and (195, 44).
; PLAN: r0=304(x1), r1=111(y1), r2=195(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 111
LDI r2, 195
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
