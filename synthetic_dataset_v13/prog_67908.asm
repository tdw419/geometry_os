; DESCRIPTION: Composite: Renders a red box of size 48x19 starting at (334, 209) then Renders a green disk with center (410, 133) and radius 59 then Renders a green line between points (397, 7) and (97, 50).
; PLAN: r0=334(x), r1=209(y), r2=48(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=133(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x1), r11=7(y1), r12=97(x2), r13=50(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 209
LDI r2, 48
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 133
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 7
LDI r12, 97
LDI r13, 50
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
