; DESCRIPTION: Renders a cyan line between points (327, 26) and (24, 20).
; PLAN: r0=327(x1), r1=26(y1), r2=24(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 26
LDI r2, 24
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
