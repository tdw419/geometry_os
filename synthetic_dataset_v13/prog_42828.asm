; DESCRIPTION: Composite: Draws a purple circle centered at (113, 181) with radius 64 then Draws a green line from (415, 226) to (436, 93).
; PLAN: r0=113(x), r1=181(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=226(y1), r7=436(x2), r8=93(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 181
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 226
LDI r7, 436
LDI r8, 93
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
