; DESCRIPTION: Composite: Creates a cyan circular shape at (409, 153) with radius 77 then Draws a blue line from (180, 188) to (173, 144).
; PLAN: r0=409(x), r1=153(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x1), r6=188(y1), r7=173(x2), r8=144(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 153
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 188
LDI r7, 173
LDI r8, 144
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
