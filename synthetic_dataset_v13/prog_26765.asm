; DESCRIPTION: Composite: Creates a magenta rectangular region at (269, 141) spanning 54 by 82 pixels then Draws a white line from (111, 152) to (351, 83).
; PLAN: r0=269(x), r1=141(y), r2=54(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x1), r6=152(y1), r7=351(x2), r8=83(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 141
LDI r2, 54
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 152
LDI r7, 351
LDI r8, 83
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
