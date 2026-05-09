; DESCRIPTION: Composite: Draws a magenta circle centered at (418, 209) with radius 35 then Draws a cyan line from (415, 63) to (416, 183).
; PLAN: r0=418(x), r1=209(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=63(y1), r7=416(x2), r8=183(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 209
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 63
LDI r7, 416
LDI r8, 183
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
