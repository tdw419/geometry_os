; DESCRIPTION: Places a cyan line segment connecting (394, 233) to (362, 80).
; PLAN: r0=394(x1), r1=233(y1), r2=362(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 233
LDI r2, 362
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
