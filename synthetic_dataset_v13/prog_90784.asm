; DESCRIPTION: Places a cyan line segment connecting (367, 134) to (225, 24).
; PLAN: r0=367(x1), r1=134(y1), r2=225(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 134
LDI r2, 225
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
