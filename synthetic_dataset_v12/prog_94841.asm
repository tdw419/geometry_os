; DESCRIPTION: Composite: Places a white circle of radius 65 at center (375, 188) then Draws a magenta line from (395, 223) to (504, 46).
; PLAN: r0=375(x), r1=188(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x1), r6=223(y1), r7=504(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 188
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 223
LDI r7, 504
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
