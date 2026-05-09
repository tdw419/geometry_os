; DESCRIPTION: Composite: Places a yellow circle of radius 23 at center (320, 89) then Places a red line segment connecting (279, 135) to (504, 20).
; PLAN: r0=320(x), r1=89(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=135(y1), r7=504(x2), r8=20(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 89
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 135
LDI r7, 504
LDI r8, 20
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
