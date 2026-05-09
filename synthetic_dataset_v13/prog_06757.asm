; DESCRIPTION: Composite: Draws a black line from (104, 80) to (35, 190) then Renders a orange box of size 64x22 starting at (255, 200).
; PLAN: r0=104(x1), r1=80(y1), r2=35(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=200(y), r7=64(width), r8=22(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 80
LDI r2, 35
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 200
LDI r7, 64
LDI r8, 22
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
