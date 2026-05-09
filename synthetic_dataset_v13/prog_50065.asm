; DESCRIPTION: Composite: Places a yellow circle of radius 70 at center (317, 71) then Places a magenta line segment connecting (502, 13) to (403, 46).
; PLAN: r0=317(x), r1=71(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=13(y1), r7=403(x2), r8=46(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 71
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 13
LDI r7, 403
LDI r8, 46
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
