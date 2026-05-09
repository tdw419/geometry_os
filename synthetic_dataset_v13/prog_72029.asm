; DESCRIPTION: Composite: Renders a purple disk with center (470, 71) and radius 18 then Places a blue line segment connecting (450, 135) to (18, 193) then Creates a blue rectangular region at (431, 47) spanning 59 by 50 pixels.
; PLAN: r0=470(x), r1=71(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=135(y1), r7=18(x2), r8=193(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=431(x), r11=47(y), r12=59(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 71
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 135
LDI r7, 18
LDI r8, 193
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 431
LDI r11, 47
LDI r12, 59
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
