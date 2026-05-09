; DESCRIPTION: Composite: Renders a magenta line between points (8, 27) and (349, 237) then Renders a yellow box of size 72x84 starting at (18, 127).
; PLAN: r0=8(x1), r1=27(y1), r2=349(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=127(y), r7=72(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 27
LDI r2, 349
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 127
LDI r7, 72
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
