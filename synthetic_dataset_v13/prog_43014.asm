; DESCRIPTION: Composite: Renders a black box of size 110x87 starting at (166, 122) then Draws a white line from (371, 50) to (120, 92).
; PLAN: r0=166(x), r1=122(y), r2=110(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=50(y1), r7=120(x2), r8=92(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 122
LDI r2, 110
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 50
LDI r7, 120
LDI r8, 92
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
