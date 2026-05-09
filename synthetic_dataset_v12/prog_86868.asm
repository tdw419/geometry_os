; DESCRIPTION: Composite: Renders a cyan line between points (295, 122) and (90, 51) then Draws a green rectangle at (224, 140) with width 48 and height 45.
; PLAN: r0=295(x1), r1=122(y1), r2=90(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=140(y), r7=48(width), r8=45(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 122
LDI r2, 90
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 140
LDI r7, 48
LDI r8, 45
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
