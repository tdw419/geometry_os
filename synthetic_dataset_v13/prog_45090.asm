; DESCRIPTION: Renders a cyan line between points (410, 206) and (505, 148).
; PLAN: r0=410(x1), r1=206(y1), r2=505(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 206
LDI r2, 505
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
