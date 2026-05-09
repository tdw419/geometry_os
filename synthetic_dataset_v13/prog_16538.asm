; DESCRIPTION: Places a cyan line segment connecting (202, 45) to (371, 37).
; PLAN: r0=202(x1), r1=45(y1), r2=371(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 45
LDI r2, 371
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
