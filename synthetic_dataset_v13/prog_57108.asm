; DESCRIPTION: Composite: Sets a single magenta pixel at (330, 53) then Renders a cyan line between points (184, 38) and (10, 56) then Creates a black rectangular region at (320, 35) spanning 71 by 60 pixels.
; PLAN: r0=330(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=38(y1), r7=10(x2), r8=56(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=35(y), r12=71(width), r13=60(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 38
LDI r7, 10
LDI r8, 56
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 35
LDI r12, 71
LDI r13, 60
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
