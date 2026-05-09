; DESCRIPTION: Composite: Places a cyan line segment connecting (9, 181) to (292, 111) then Creates a blue rectangular region at (284, 126) spanning 70 by 12 pixels then Places a black dot at position (200, 186).
; PLAN: r0=9(x1), r1=181(y1), r2=292(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=126(y), r7=70(width), r8=12(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=186(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 181
LDI r2, 292
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 126
LDI r7, 70
LDI r8, 12
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 186
LDI r12, 0x000000
PSET r10, r11, r12
HALT
