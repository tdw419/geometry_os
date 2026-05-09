; DESCRIPTION: Composite: Places a cyan line segment connecting (248, 16) to (180, 98) then Draws a cyan rectangle at (40, 171) with width 80 and height 41.
; PLAN: r0=248(x1), r1=16(y1), r2=180(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=171(y), r7=80(width), r8=41(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 16
LDI r2, 180
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 171
LDI r7, 80
LDI r8, 41
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
