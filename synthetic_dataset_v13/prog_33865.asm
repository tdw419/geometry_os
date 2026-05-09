; DESCRIPTION: Renders a cyan line between points (411, 39) and (360, 206).
; PLAN: r0=411(x1), r1=39(y1), r2=360(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 39
LDI r2, 360
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
