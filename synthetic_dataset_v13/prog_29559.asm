; DESCRIPTION: Composite: Renders a red disk with center (400, 144) and radius 55 then Renders a red line between points (273, 127) and (108, 7) then Renders a red box of size 85x47 starting at (107, 95).
; PLAN: r0=400(x), r1=144(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x1), r6=127(y1), r7=108(x2), r8=7(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=107(x), r11=95(y), r12=85(width), r13=47(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 144
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 127
LDI r7, 108
LDI r8, 7
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 95
LDI r12, 85
LDI r13, 47
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
