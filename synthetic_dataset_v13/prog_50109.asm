; DESCRIPTION: Renders a cyan line between points (374, 217) and (295, 233).
; PLAN: r0=374(x1), r1=217(y1), r2=295(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 217
LDI r2, 295
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
