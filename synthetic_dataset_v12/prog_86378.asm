; DESCRIPTION: Composite: Places a purple 59x46 rectangle at position (124, 204) then Draws a cyan line from (238, 248) to (17, 196) then Creates a green circular shape at (368, 135) with radius 50.
; PLAN: r0=124(x), r1=204(y), r2=59(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=248(y1), r7=17(x2), r8=196(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=135(y), r12=50(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 124
LDI r1, 204
LDI r2, 59
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 248
LDI r7, 17
LDI r8, 196
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 135
LDI r12, 50
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
