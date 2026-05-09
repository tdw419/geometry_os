; DESCRIPTION: Places a cyan line segment connecting (299, 127) to (436, 24).
; PLAN: r0=299(x1), r1=127(y1), r2=436(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 127
LDI r2, 436
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
