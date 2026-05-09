; DESCRIPTION: Composite: Renders a green disk with center (139, 120) and radius 59 then Draws a magenta line from (436, 84) to (150, 228).
; PLAN: r0=139(x), r1=120(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x1), r6=84(y1), r7=150(x2), r8=228(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 139
LDI r1, 120
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 84
LDI r7, 150
LDI r8, 228
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
