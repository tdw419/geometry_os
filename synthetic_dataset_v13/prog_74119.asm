; DESCRIPTION: Renders a cyan line between points (326, 25) and (121, 26).
; PLAN: r0=326(x1), r1=25(y1), r2=121(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 25
LDI r2, 121
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
