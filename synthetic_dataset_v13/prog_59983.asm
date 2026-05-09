; DESCRIPTION: Composite: Draws a yellow rectangle at (267, 223) with width 94 and height 28 then Places a white line segment connecting (137, 131) to (298, 243).
; PLAN: r0=267(x), r1=223(y), r2=94(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x1), r6=131(y1), r7=298(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 223
LDI r2, 94
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 131
LDI r7, 298
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
