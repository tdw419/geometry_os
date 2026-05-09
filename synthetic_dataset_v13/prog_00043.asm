; DESCRIPTION: Composite: Renders a orange box of size 42x14 starting at (189, 7) then Draws a blue line from (315, 47) to (217, 228).
; PLAN: r0=189(x), r1=7(y), r2=42(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x1), r6=47(y1), r7=217(x2), r8=228(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 7
LDI r2, 42
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 47
LDI r7, 217
LDI r8, 228
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
