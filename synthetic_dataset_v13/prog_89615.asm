; DESCRIPTION: Places a cyan line segment connecting (97, 47) to (434, 33).
; PLAN: r0=97(x1), r1=47(y1), r2=434(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 47
LDI r2, 434
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
