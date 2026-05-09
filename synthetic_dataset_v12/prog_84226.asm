; DESCRIPTION: Places a cyan line segment connecting (21, 160) to (403, 127).
; PLAN: r0=21(x1), r1=160(y1), r2=403(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 160
LDI r2, 403
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
