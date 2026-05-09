; DESCRIPTION: Composite: Places a orange 20x38 rectangle at position (17, 171) then Draws a cyan line from (118, 75) to (497, 215).
; PLAN: r0=17(x), r1=171(y), r2=20(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=75(y1), r7=497(x2), r8=215(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 171
LDI r2, 20
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 75
LDI r7, 497
LDI r8, 215
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
