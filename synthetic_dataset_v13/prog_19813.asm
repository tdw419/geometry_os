; DESCRIPTION: Places a white line segment connecting (283, 30) to (298, 242).
; PLAN: r0=283(x1), r1=30(y1), r2=298(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 30
LDI r2, 298
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
