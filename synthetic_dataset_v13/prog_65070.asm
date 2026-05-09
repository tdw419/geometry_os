; DESCRIPTION: Composite: Places a blue circle of radius 32 at center (320, 220) then Draws a orange line from (2, 206) to (470, 195).
; PLAN: r0=320(x), r1=220(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=2(x1), r6=206(y1), r7=470(x2), r8=195(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 220
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 2
LDI r6, 206
LDI r7, 470
LDI r8, 195
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
