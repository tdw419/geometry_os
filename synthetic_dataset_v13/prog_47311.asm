; DESCRIPTION: Places a cyan line segment connecting (298, 210) to (395, 147).
; PLAN: r0=298(x1), r1=210(y1), r2=395(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 210
LDI r2, 395
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
