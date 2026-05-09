; DESCRIPTION: Composite: Places a blue circle of radius 59 at center (276, 86) then Renders a cyan line between points (96, 188) and (176, 221).
; PLAN: r0=276(x), r1=86(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x1), r6=188(y1), r7=176(x2), r8=221(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 86
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 188
LDI r7, 176
LDI r8, 221
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
