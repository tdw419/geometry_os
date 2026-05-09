; DESCRIPTION: Composite: Places a blue line segment connecting (336, 110) to (502, 19) then Creates a red rectangular region at (28, 84) spanning 110 by 105 pixels then Places a cyan dot at position (154, 214).
; PLAN: r0=336(x1), r1=110(y1), r2=502(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=28(x), r6=84(y), r7=110(width), r8=105(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x), r11=214(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 110
LDI r2, 502
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 84
LDI r7, 110
LDI r8, 105
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 214
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
