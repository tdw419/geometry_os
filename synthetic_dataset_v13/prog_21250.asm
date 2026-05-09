; DESCRIPTION: Composite: Places a magenta line segment connecting (184, 62) to (298, 204) then Places a white circle of radius 33 at center (243, 74).
; PLAN: r0=184(x1), r1=62(y1), r2=298(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=74(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 62
LDI r2, 298
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 74
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
