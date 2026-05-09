; DESCRIPTION: Composite: Renders a cyan box of size 54x94 starting at (423, 142) then Places a blue line segment connecting (385, 171) to (347, 112).
; PLAN: r0=423(x), r1=142(y), r2=54(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x1), r6=171(y1), r7=347(x2), r8=112(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 142
LDI r2, 54
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 171
LDI r7, 347
LDI r8, 112
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
