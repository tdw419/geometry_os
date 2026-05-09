; DESCRIPTION: Composite: Draws a white line from (210, 35) to (398, 209) then Creates a green rectangular region at (350, 74) spanning 18 by 39 pixels.
; PLAN: r0=210(x1), r1=35(y1), r2=398(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=74(y), r7=18(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 35
LDI r2, 398
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 74
LDI r7, 18
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
