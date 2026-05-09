; DESCRIPTION: Composite: Draws a cyan circle centered at (215, 33) with radius 28 then Draws a cyan line from (63, 181) to (133, 204) then Renders a magenta box of size 109x61 starting at (391, 158).
; PLAN: r0=215(x), r1=33(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x1), r6=181(y1), r7=133(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=158(y), r12=109(width), r13=61(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 33
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 181
LDI r7, 133
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 158
LDI r12, 109
LDI r13, 61
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
