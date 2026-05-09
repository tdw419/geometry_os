; DESCRIPTION: Composite: Draws a cyan rectangle at (290, 184) with width 106 and height 53 then Renders a red disk with center (401, 126) and radius 77 then Renders a green line between points (410, 202) and (142, 209).
; PLAN: r0=290(x), r1=184(y), r2=106(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=126(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x1), r11=202(y1), r12=142(x2), r13=209(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 184
LDI r2, 106
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 126
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 202
LDI r12, 142
LDI r13, 209
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
