; DESCRIPTION: Composite: Draws a cyan line from (368, 244) to (95, 163) then Renders a blue box of size 29x59 starting at (63, 74).
; PLAN: r0=368(x1), r1=244(y1), r2=95(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=74(y), r7=29(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 244
LDI r2, 95
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 74
LDI r7, 29
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
