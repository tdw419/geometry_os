; DESCRIPTION: Composite: Renders a cyan disk with center (372, 64) and radius 43 then Places a orange line segment connecting (403, 180) to (123, 37) then Renders a orange box of size 27x111 starting at (472, 21).
; PLAN: r0=372(x), r1=64(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=180(y1), r7=123(x2), r8=37(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=472(x), r11=21(y), r12=27(width), r13=111(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 372
LDI r1, 64
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 180
LDI r7, 123
LDI r8, 37
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 472
LDI r11, 21
LDI r12, 27
LDI r13, 111
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
