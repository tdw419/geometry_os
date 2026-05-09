; DESCRIPTION: Composite: Places a green circle of radius 67 at center (299, 143) then Renders a blue line between points (307, 9) and (362, 44).
; PLAN: r0=299(x), r1=143(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=9(y1), r7=362(x2), r8=44(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 143
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 9
LDI r7, 362
LDI r8, 44
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
