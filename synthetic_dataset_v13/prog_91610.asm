; DESCRIPTION: Renders a cyan line between points (243, 150) and (410, 232).
; PLAN: r0=243(x1), r1=150(y1), r2=410(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 150
LDI r2, 410
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
