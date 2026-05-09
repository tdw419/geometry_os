; DESCRIPTION: Composite: Renders a magenta disk with center (116, 133) and radius 34 then Places a green line segment connecting (218, 93) to (76, 142).
; PLAN: r0=116(x), r1=133(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=218(x1), r6=93(y1), r7=76(x2), r8=142(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 133
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 218
LDI r6, 93
LDI r7, 76
LDI r8, 142
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
