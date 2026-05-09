; DESCRIPTION: Places a cyan line segment connecting (368, 233) to (217, 194).
; PLAN: r0=368(x1), r1=233(y1), r2=217(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 233
LDI r2, 217
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
