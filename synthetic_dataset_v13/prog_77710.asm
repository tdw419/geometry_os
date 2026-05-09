; DESCRIPTION: Composite: Creates a cyan circular shape at (301, 67) with radius 61 then Renders a blue line between points (403, 137) and (202, 116) then Draws a blue rectangle at (7, 121) with width 20 and height 77.
; PLAN: r0=301(x), r1=67(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=137(y1), r7=202(x2), r8=116(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=121(y), r12=20(width), r13=77(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 67
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 137
LDI r7, 202
LDI r8, 116
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 121
LDI r12, 20
LDI r13, 77
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
