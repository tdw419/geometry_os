; DESCRIPTION: Composite: Draws a cyan line from (351, 143) to (188, 238) then Draws a cyan rectangle at (403, 62) with width 45 and height 46.
; PLAN: r0=351(x1), r1=143(y1), r2=188(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=62(y), r7=45(width), r8=46(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 143
LDI r2, 188
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 62
LDI r7, 45
LDI r8, 46
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
