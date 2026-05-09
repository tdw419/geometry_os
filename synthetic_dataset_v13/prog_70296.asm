; DESCRIPTION: Composite: Renders a red line between points (113, 200) and (465, 168) then Renders a blue disk with center (142, 123) and radius 19 then Renders a cyan box of size 83x65 starting at (218, 48).
; PLAN: r0=113(x1), r1=200(y1), r2=465(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=123(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=48(y), r12=83(width), r13=65(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 200
LDI r2, 465
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 123
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 48
LDI r12, 83
LDI r13, 65
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
