; DESCRIPTION: Places a cyan line segment connecting (98, 199) to (410, 193).
; PLAN: r0=98(x1), r1=199(y1), r2=410(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 199
LDI r2, 410
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
