; DESCRIPTION: Places a cyan line segment connecting (435, 73) to (6, 236).
; PLAN: r0=435(x1), r1=73(y1), r2=6(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 73
LDI r2, 6
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
