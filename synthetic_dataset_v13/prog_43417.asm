; DESCRIPTION: Composite: Places a green line segment connecting (484, 135) to (115, 144) then Places a white dot at position (6, 152).
; PLAN: r0=484(x1), r1=135(y1), r2=115(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=152(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 484
LDI r1, 135
LDI r2, 115
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 152
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
