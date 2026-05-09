; DESCRIPTION: Places a cyan line segment connecting (333, 230) to (278, 46).
; PLAN: r0=333(x1), r1=230(y1), r2=278(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 230
LDI r2, 278
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
