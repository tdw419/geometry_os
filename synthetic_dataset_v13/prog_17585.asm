; DESCRIPTION: Composite: Draws a red line from (307, 247) to (106, 68) then Draws a magenta circle centered at (443, 82) with radius 29 then Renders a green box of size 75x44 starting at (107, 114).
; PLAN: r0=307(x1), r1=247(y1), r2=106(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=82(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=114(y), r12=75(width), r13=44(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 247
LDI r2, 106
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 82
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 114
LDI r12, 75
LDI r13, 44
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
