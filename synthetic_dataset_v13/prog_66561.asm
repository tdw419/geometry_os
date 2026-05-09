; DESCRIPTION: Renders a green line between points (410, 168) and (110, 125).
; PLAN: r0=410(x1), r1=168(y1), r2=110(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 168
LDI r2, 110
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
