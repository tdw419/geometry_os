; DESCRIPTION: Places a cyan line segment connecting (21, 127) to (491, 221).
; PLAN: r0=21(x1), r1=127(y1), r2=491(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 127
LDI r2, 491
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
