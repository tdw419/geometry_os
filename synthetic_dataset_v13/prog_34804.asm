; DESCRIPTION: Composite: Draws a yellow line from (202, 229) to (173, 154) then Renders a red disk with center (138, 66) and radius 59.
; PLAN: r0=202(x1), r1=229(y1), r2=173(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=66(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 202
LDI r1, 229
LDI r2, 173
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 66
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
