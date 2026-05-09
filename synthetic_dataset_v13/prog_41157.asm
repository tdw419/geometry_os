; DESCRIPTION: Composite: Places a yellow circle of radius 41 at center (227, 204) then Sets a single magenta pixel at (207, 149) then Renders a red box of size 111x55 starting at (387, 174).
; PLAN: r0=227(x), r1=204(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=149(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=387(x), r11=174(y), r12=111(width), r13=55(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 204
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 149
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 387
LDI r11, 174
LDI r12, 111
LDI r13, 55
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
