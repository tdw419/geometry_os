; DESCRIPTION: Renders a cyan line between points (304, 165) and (272, 5).
; PLAN: r0=304(x1), r1=165(y1), r2=272(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 165
LDI r2, 272
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
