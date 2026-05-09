; DESCRIPTION: Composite: Creates a red rectangular region at (142, 223) spanning 47 by 19 pixels then Draws a white line from (380, 214) to (362, 5).
; PLAN: r0=142(x), r1=223(y), r2=47(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=214(y1), r7=362(x2), r8=5(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 223
LDI r2, 47
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 214
LDI r7, 362
LDI r8, 5
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
