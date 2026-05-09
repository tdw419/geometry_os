; DESCRIPTION: Composite: Places a white line segment connecting (210, 111) to (313, 160) then Places a blue circle of radius 25 at center (32, 44).
; PLAN: r0=210(x1), r1=111(y1), r2=313(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=32(x), r6=44(y), r7=25(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 210
LDI r1, 111
LDI r2, 313
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 44
LDI r7, 25
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
