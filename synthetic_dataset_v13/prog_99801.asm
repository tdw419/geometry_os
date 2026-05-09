; DESCRIPTION: Composite: Renders a white line between points (240, 255) and (214, 81) then Draws a cyan rectangle at (190, 139) with width 49 and height 96.
; PLAN: r0=240(x1), r1=255(y1), r2=214(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=190(x), r6=139(y), r7=49(width), r8=96(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 255
LDI r2, 214
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 139
LDI r7, 49
LDI r8, 96
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
