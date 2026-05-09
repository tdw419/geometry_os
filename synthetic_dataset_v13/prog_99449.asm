; DESCRIPTION: Draws a cyan line from (407, 233) to (18, 70).
; PLAN: r0=407(x1), r1=233(y1), r2=18(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 233
LDI r2, 18
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
