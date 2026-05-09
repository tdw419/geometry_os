; DESCRIPTION: Composite: Draws a green line from (288, 217) to (379, 107) then Draws a blue rectangle at (160, 108) with width 60 and height 31.
; PLAN: r0=288(x1), r1=217(y1), r2=379(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=108(y), r7=60(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 217
LDI r2, 379
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 108
LDI r7, 60
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
