; DESCRIPTION: Composite: Places a green line segment connecting (369, 111) to (245, 171) then Renders a magenta disk with center (272, 196) and radius 59.
; PLAN: r0=369(x1), r1=111(y1), r2=245(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=196(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 111
LDI r2, 245
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 196
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
