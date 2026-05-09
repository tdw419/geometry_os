; DESCRIPTION: Composite: Places a black 67x82 rectangle at position (152, 174) then Renders a cyan disk with center (214, 79) and radius 60 then Places a blue line segment connecting (271, 64) to (470, 119).
; PLAN: r0=152(x), r1=174(y), r2=67(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=79(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x1), r11=64(y1), r12=470(x2), r13=119(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 174
LDI r2, 67
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 79
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 64
LDI r12, 470
LDI r13, 119
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
