; DESCRIPTION: Places a cyan line segment connecting (19, 220) to (236, 152).
; PLAN: r0=19(x1), r1=220(y1), r2=236(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 220
LDI r2, 236
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
