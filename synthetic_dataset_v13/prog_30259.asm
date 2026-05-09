; DESCRIPTION: Composite: Draws a cyan rectangle at (377, 120) with width 56 and height 116 then Renders a magenta line between points (212, 214) and (69, 92).
; PLAN: r0=377(x), r1=120(y), r2=56(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=214(y1), r7=69(x2), r8=92(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 120
LDI r2, 56
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 214
LDI r7, 69
LDI r8, 92
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
