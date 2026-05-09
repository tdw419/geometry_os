; DESCRIPTION: Composite: Draws a cyan line from (453, 121) to (405, 54) then Creates a black rectangular region at (56, 76) spanning 29 by 120 pixels.
; PLAN: r0=453(x1), r1=121(y1), r2=405(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=76(y), r7=29(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 121
LDI r2, 405
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 76
LDI r7, 29
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
