; DESCRIPTION: Composite: Draws a yellow rectangle at (463, 103) with width 43 and height 96 then Renders a cyan line between points (259, 229) and (256, 59).
; PLAN: r0=463(x), r1=103(y), r2=43(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x1), r6=229(y1), r7=256(x2), r8=59(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 103
LDI r2, 43
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 229
LDI r7, 256
LDI r8, 59
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
