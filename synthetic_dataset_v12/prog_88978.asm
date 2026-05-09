; DESCRIPTION: Composite: Places a blue circle of radius 33 at center (365, 177) then Draws a white line from (408, 196) to (283, 70).
; PLAN: r0=365(x), r1=177(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x1), r6=196(y1), r7=283(x2), r8=70(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 177
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 196
LDI r7, 283
LDI r8, 70
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
