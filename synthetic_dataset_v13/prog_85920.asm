; DESCRIPTION: Composite: Draws a cyan rectangle at (167, 50) with width 57 and height 59 then Draws a orange line from (213, 151) to (404, 68).
; PLAN: r0=167(x), r1=50(y), r2=57(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=151(y1), r7=404(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 50
LDI r2, 57
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 151
LDI r7, 404
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
