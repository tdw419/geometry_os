; DESCRIPTION: Composite: Places a blue circle of radius 53 at center (405, 131) then Draws a yellow line from (234, 180) to (482, 19).
; PLAN: r0=405(x), r1=131(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x1), r6=180(y1), r7=482(x2), r8=19(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 131
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 180
LDI r7, 482
LDI r8, 19
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
