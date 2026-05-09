; DESCRIPTION: Composite: Draws a yellow line from (470, 38) to (255, 174) then Places a yellow circle of radius 32 at center (283, 209).
; PLAN: r0=470(x1), r1=38(y1), r2=255(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=283(x), r6=209(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 470
LDI r1, 38
LDI r2, 255
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 209
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
