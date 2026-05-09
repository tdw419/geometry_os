; DESCRIPTION: Composite: Places a magenta line segment connecting (47, 255) to (354, 247) then Renders a red disk with center (146, 86) and radius 46.
; PLAN: r0=47(x1), r1=255(y1), r2=354(x2), r3=247(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=86(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 255
LDI r2, 354
LDI r3, 247
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 86
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
