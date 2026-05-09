; DESCRIPTION: Composite: Places a green circle of radius 70 at center (92, 143) then Renders a yellow line between points (298, 207) and (273, 209).
; PLAN: r0=92(x), r1=143(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=207(y1), r7=273(x2), r8=209(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 143
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 207
LDI r7, 273
LDI r8, 209
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
