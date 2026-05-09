; DESCRIPTION: Renders a cyan line between points (380, 86) and (198, 158).
; PLAN: r0=380(x1), r1=86(y1), r2=198(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 86
LDI r2, 198
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
