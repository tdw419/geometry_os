; DESCRIPTION: Renders a cyan line between points (333, 40) and (372, 97).
; PLAN: r0=333(x1), r1=40(y1), r2=372(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 40
LDI r2, 372
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
