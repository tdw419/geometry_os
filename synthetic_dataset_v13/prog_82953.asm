; DESCRIPTION: Places a cyan line segment connecting (117, 230) to (146, 70).
; PLAN: r0=117(x1), r1=230(y1), r2=146(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 230
LDI r2, 146
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
