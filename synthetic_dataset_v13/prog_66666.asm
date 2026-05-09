; DESCRIPTION: Composite: Draws a purple line from (213, 236) to (84, 61) then Renders a cyan disk with center (190, 161) and radius 24 then Draws a magenta rectangle at (91, 120) with width 13 and height 28.
; PLAN: r0=213(x1), r1=236(y1), r2=84(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=161(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=91(x), r11=120(y), r12=13(width), r13=28(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 236
LDI r2, 84
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 161
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 91
LDI r11, 120
LDI r12, 13
LDI r13, 28
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
