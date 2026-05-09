; DESCRIPTION: Renders a cyan line between points (98, 239) and (151, 201).
; PLAN: r0=98(x1), r1=239(y1), r2=151(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 239
LDI r2, 151
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
