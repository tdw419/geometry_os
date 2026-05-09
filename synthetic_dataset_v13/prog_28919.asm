; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (295, 124) then Places a blue line segment connecting (309, 141) to (243, 179).
; PLAN: r0=295(x), r1=124(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x1), r6=141(y1), r7=243(x2), r8=179(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 124
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 141
LDI r7, 243
LDI r8, 179
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
