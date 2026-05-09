; DESCRIPTION: Composite: Sets a single red pixel at (473, 254) then Creates a red rectangular region at (239, 129) spanning 107 by 68 pixels then Renders a orange line between points (400, 223) and (397, 189).
; PLAN: r0=473(x), r1=254(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=129(y), r7=107(width), r8=68(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x1), r11=223(y1), r12=397(x2), r13=189(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 254
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 239
LDI r6, 129
LDI r7, 107
LDI r8, 68
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 223
LDI r12, 397
LDI r13, 189
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
