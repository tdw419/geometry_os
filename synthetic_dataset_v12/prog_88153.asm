; DESCRIPTION: Places a cyan line segment connecting (182, 198) to (143, 60).
; PLAN: r0=182(x1), r1=198(y1), r2=143(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 198
LDI r2, 143
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
