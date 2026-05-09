; DESCRIPTION: Places a cyan line segment connecting (214, 149) to (435, 211).
; PLAN: r0=214(x1), r1=149(y1), r2=435(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 149
LDI r2, 435
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
