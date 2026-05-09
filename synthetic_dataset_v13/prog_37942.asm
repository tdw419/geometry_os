; DESCRIPTION: Composite: Draws a green circle centered at (295, 55) with radius 28 then Renders a white line between points (123, 60) and (305, 92).
; PLAN: r0=295(x), r1=55(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x1), r6=60(y1), r7=305(x2), r8=92(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 55
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 60
LDI r7, 305
LDI r8, 92
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
