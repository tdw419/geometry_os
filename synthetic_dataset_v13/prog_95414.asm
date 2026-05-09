; DESCRIPTION: Composite: Draws a cyan line from (161, 203) to (408, 64) then Renders a cyan box of size 34x62 starting at (335, 161).
; PLAN: r0=161(x1), r1=203(y1), r2=408(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=335(x), r6=161(y), r7=34(width), r8=62(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 203
LDI r2, 408
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 335
LDI r6, 161
LDI r7, 34
LDI r8, 62
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
