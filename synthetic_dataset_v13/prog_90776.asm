; DESCRIPTION: Composite: Draws a red rectangle at (136, 16) with width 39 and height 108 then Draws a cyan line from (320, 229) to (63, 6).
; PLAN: r0=136(x), r1=16(y), r2=39(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x1), r6=229(y1), r7=63(x2), r8=6(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 16
LDI r2, 39
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 229
LDI r7, 63
LDI r8, 6
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
