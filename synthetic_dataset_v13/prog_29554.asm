; DESCRIPTION: Composite: Creates a orange rectangular region at (387, 143) spanning 112 by 82 pixels then Draws a green line from (470, 243) to (177, 153).
; PLAN: r0=387(x), r1=143(y), r2=112(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x1), r6=243(y1), r7=177(x2), r8=153(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 143
LDI r2, 112
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 243
LDI r7, 177
LDI r8, 153
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
