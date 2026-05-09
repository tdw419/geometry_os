; DESCRIPTION: Composite: Places a blue circle of radius 37 at center (382, 129) then Draws a blue line from (317, 65) to (288, 37).
; PLAN: r0=382(x), r1=129(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x1), r6=65(y1), r7=288(x2), r8=37(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 129
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 65
LDI r7, 288
LDI r8, 37
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
