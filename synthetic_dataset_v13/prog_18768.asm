; DESCRIPTION: Composite: Places a white circle of radius 77 at center (271, 144) then Renders a magenta line between points (50, 38) and (445, 154) then Sets a single blue pixel at (503, 207).
; PLAN: r0=271(x), r1=144(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=50(x1), r6=38(y1), r7=445(x2), r8=154(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=207(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 144
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 50
LDI r6, 38
LDI r7, 445
LDI r8, 154
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 207
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
