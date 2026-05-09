; DESCRIPTION: Composite: Places a black 28x76 rectangle at position (470, 5) then Draws a magenta line from (333, 29) to (502, 146) then Draws a green circle centered at (441, 159) with radius 59.
; PLAN: r0=470(x), r1=5(y), r2=28(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=29(y1), r7=502(x2), r8=146(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=159(y), r12=59(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 470
LDI r1, 5
LDI r2, 28
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 29
LDI r7, 502
LDI r8, 146
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 159
LDI r12, 59
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
