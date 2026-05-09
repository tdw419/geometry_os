; DESCRIPTION: Composite: Draws a red rectangle at (197, 98) with width 51 and height 33 then Renders a cyan line between points (400, 76) and (482, 230).
; PLAN: r0=197(x), r1=98(y), r2=51(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=76(y1), r7=482(x2), r8=230(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 197
LDI r1, 98
LDI r2, 51
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 76
LDI r7, 482
LDI r8, 230
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
