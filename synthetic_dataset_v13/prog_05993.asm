; DESCRIPTION: Composite: Renders a yellow line between points (458, 111) and (218, 223) then Places a blue circle of radius 74 at center (422, 104) then Renders a cyan box of size 71x116 starting at (117, 130).
; PLAN: r0=458(x1), r1=111(y1), r2=218(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=104(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=130(y), r12=71(width), r13=116(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 111
LDI r2, 218
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 104
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 130
LDI r12, 71
LDI r13, 116
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
