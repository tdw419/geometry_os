; DESCRIPTION: Composite: Renders a yellow box of size 72x86 starting at (171, 108) then Draws a cyan line from (116, 188) to (308, 0) then Draws a magenta circle centered at (298, 130) with radius 66.
; PLAN: r0=171(x), r1=108(y), r2=72(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=188(y1), r7=308(x2), r8=0(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=298(x), r11=130(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 108
LDI r2, 72
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 188
LDI r7, 308
LDI r8, 0
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 130
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
