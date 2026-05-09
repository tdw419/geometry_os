; DESCRIPTION: Composite: Draws a magenta line from (206, 82) to (367, 121) then Creates a yellow rectangular region at (108, 182) spanning 78 by 34 pixels.
; PLAN: r0=206(x1), r1=82(y1), r2=367(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=182(y), r7=78(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 82
LDI r2, 367
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 182
LDI r7, 78
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
