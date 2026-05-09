; DESCRIPTION: Composite: Places a white circle of radius 15 at center (178, 121) then Draws a blue line from (250, 152) to (493, 89).
; PLAN: r0=178(x), r1=121(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x1), r6=152(y1), r7=493(x2), r8=89(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 121
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 152
LDI r7, 493
LDI r8, 89
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
