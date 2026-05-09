; DESCRIPTION: Places a cyan line segment connecting (56, 12) to (48, 236).
; PLAN: r0=56(x1), r1=12(y1), r2=48(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 12
LDI r2, 48
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
