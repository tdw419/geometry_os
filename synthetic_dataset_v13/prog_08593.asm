; DESCRIPTION: Renders a cyan line between points (446, 221) and (411, 52).
; PLAN: r0=446(x1), r1=221(y1), r2=411(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 221
LDI r2, 411
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
