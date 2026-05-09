; DESCRIPTION: Composite: Creates a orange circular shape at (173, 135) with radius 36 then Sets a single green pixel at (258, 180) then Draws a blue line from (464, 204) to (196, 221).
; PLAN: r0=173(x), r1=135(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=464(x1), r11=204(y1), r12=196(x2), r13=221(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 135
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 464
LDI r11, 204
LDI r12, 196
LDI r13, 221
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
