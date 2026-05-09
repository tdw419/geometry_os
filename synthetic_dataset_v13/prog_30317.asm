; DESCRIPTION: Renders a cyan line between points (374, 232) and (410, 107).
; PLAN: r0=374(x1), r1=232(y1), r2=410(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 232
LDI r2, 410
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
