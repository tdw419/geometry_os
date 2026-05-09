; DESCRIPTION: Renders a cyan line between points (328, 213) and (349, 161).
; PLAN: r0=328(x1), r1=213(y1), r2=349(x2), r3=161(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 213
LDI r2, 349
LDI r3, 161
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
