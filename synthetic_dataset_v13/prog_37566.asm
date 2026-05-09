; DESCRIPTION: Composite: Creates a blue circular shape at (243, 219) with radius 17 then Renders a orange box of size 82x46 starting at (260, 103) then Draws a red line from (374, 160) to (152, 228).
; PLAN: r0=243(x), r1=219(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=103(y), r7=82(width), r8=46(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x1), r11=160(y1), r12=152(x2), r13=228(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 219
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 103
LDI r7, 82
LDI r8, 46
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 160
LDI r12, 152
LDI r13, 228
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
