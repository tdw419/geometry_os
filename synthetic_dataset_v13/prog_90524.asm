; DESCRIPTION: Composite: Draws a green line from (103, 47) to (148, 223) then Places a red circle of radius 66 at center (314, 113).
; PLAN: r0=103(x1), r1=47(y1), r2=148(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=113(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 47
LDI r2, 148
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 113
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
