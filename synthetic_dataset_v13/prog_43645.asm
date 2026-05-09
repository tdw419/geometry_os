; DESCRIPTION: Places a red line segment connecting (504, 130) to (440, 242).
; PLAN: r0=504(x1), r1=130(y1), r2=440(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 130
LDI r2, 440
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
