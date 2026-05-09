; DESCRIPTION: Places a cyan line segment connecting (410, 241) to (244, 172).
; PLAN: r0=410(x1), r1=241(y1), r2=244(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 241
LDI r2, 244
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
