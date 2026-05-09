; DESCRIPTION: Composite: Creates a white circular shape at (398, 174) with radius 50 then Renders a green box of size 68x53 starting at (69, 68) then Draws a black line from (359, 69) to (11, 113).
; PLAN: r0=398(x), r1=174(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=68(y), r7=68(width), r8=53(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x1), r11=69(y1), r12=11(x2), r13=113(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 174
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 68
LDI r7, 68
LDI r8, 53
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 69
LDI r12, 11
LDI r13, 113
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
