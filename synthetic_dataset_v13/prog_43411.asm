; DESCRIPTION: Composite: Places a blue dot at position (380, 113) then Draws a magenta line from (220, 236) to (189, 210) then Renders a cyan box of size 10x11 starting at (4, 169).
; PLAN: r0=380(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=220(x1), r6=236(y1), r7=189(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=4(x), r11=169(y), r12=10(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 236
LDI r7, 189
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 169
LDI r12, 10
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
