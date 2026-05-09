; DESCRIPTION: Renders a cyan line between points (213, 2) and (258, 197).
; PLAN: r0=213(x1), r1=2(y1), r2=258(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 2
LDI r2, 258
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
