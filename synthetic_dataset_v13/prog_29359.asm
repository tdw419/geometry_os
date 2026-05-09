; DESCRIPTION: Renders a cyan line between points (410, 202) and (435, 43).
; PLAN: r0=410(x1), r1=202(y1), r2=435(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 202
LDI r2, 435
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
