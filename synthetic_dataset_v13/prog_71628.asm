; DESCRIPTION: Renders a cyan line between points (388, 244) and (98, 27).
; PLAN: r0=388(x1), r1=244(y1), r2=98(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 244
LDI r2, 98
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
