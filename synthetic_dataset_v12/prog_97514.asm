; DESCRIPTION: Places a cyan line segment connecting (410, 125) to (417, 146).
; PLAN: r0=410(x1), r1=125(y1), r2=417(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 125
LDI r2, 417
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
