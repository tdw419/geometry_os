; DESCRIPTION: Composite: Draws a orange rectangle at (395, 27) with width 113 and height 111 then Draws a orange line from (510, 228) to (143, 169).
; PLAN: r0=395(x), r1=27(y), r2=113(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x1), r6=228(y1), r7=143(x2), r8=169(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 27
LDI r2, 113
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 228
LDI r7, 143
LDI r8, 169
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
