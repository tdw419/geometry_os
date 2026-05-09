; DESCRIPTION: Composite: Renders a yellow box of size 16x28 starting at (330, 152) then Draws a green line from (414, 236) to (169, 43).
; PLAN: r0=330(x), r1=152(y), r2=16(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x1), r6=236(y1), r7=169(x2), r8=43(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 152
LDI r2, 16
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 236
LDI r7, 169
LDI r8, 43
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
