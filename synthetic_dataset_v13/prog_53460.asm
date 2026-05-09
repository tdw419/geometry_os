; DESCRIPTION: Composite: Creates a cyan circular shape at (121, 99) with radius 24 then Renders a cyan line between points (78, 93) and (48, 171) then Renders a orange box of size 102x59 starting at (197, 175).
; PLAN: r0=121(x), r1=99(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=93(y1), r7=48(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=197(x), r11=175(y), r12=102(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 99
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 93
LDI r7, 48
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 197
LDI r11, 175
LDI r12, 102
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
