; DESCRIPTION: Composite: Draws a green circle centered at (409, 161) with radius 79 then Draws a white line from (360, 152) to (298, 220).
; PLAN: r0=409(x), r1=161(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=152(y1), r7=298(x2), r8=220(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 161
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 152
LDI r7, 298
LDI r8, 220
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
