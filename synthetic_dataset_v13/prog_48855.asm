; DESCRIPTION: Composite: Draws a green line from (393, 36) to (68, 4) then Renders a magenta box of size 23x22 starting at (189, 71).
; PLAN: r0=393(x1), r1=36(y1), r2=68(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=189(x), r6=71(y), r7=23(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 36
LDI r2, 68
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 71
LDI r7, 23
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
