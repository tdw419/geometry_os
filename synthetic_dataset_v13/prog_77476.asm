; DESCRIPTION: Renders a cyan line between points (349, 221) and (210, 43).
; PLAN: r0=349(x1), r1=221(y1), r2=210(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 221
LDI r2, 210
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
