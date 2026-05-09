; DESCRIPTION: Composite: Draws a blue line from (431, 108) to (150, 242) then Creates a green rectangular region at (350, 141) spanning 102 by 58 pixels.
; PLAN: r0=431(x1), r1=108(y1), r2=150(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=141(y), r7=102(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 108
LDI r2, 150
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 141
LDI r7, 102
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
