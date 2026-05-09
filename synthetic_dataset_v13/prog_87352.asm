; DESCRIPTION: Composite: Draws a yellow circle centered at (239, 213) with radius 21 then Renders a red box of size 27x94 starting at (347, 47) then Renders a green line between points (382, 108) and (204, 184).
; PLAN: r0=239(x), r1=213(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=47(y), r7=27(width), r8=94(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x1), r11=108(y1), r12=204(x2), r13=184(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 213
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 47
LDI r7, 27
LDI r8, 94
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 108
LDI r12, 204
LDI r13, 184
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
