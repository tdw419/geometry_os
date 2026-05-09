; DESCRIPTION: Places a cyan line segment connecting (230, 152) to (98, 75).
; PLAN: r0=230(x1), r1=152(y1), r2=98(x2), r3=75(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 152
LDI r2, 98
LDI r3, 75
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
