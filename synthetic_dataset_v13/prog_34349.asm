; DESCRIPTION: Composite: Places a white dot at position (169, 64) then Draws a blue line from (95, 34) to (151, 253) then Renders a magenta box of size 63x54 starting at (446, 143).
; PLAN: r0=169(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=95(x1), r6=34(y1), r7=151(x2), r8=253(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=143(y), r12=63(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 95
LDI r6, 34
LDI r7, 151
LDI r8, 253
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 143
LDI r12, 63
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
