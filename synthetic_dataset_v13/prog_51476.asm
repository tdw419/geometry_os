; DESCRIPTION: Places a cyan line segment connecting (386, 71) to (503, 4).
; PLAN: r0=386(x1), r1=71(y1), r2=503(x2), r3=4(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 71
LDI r2, 503
LDI r3, 4
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
