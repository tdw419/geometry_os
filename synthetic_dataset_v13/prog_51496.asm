; DESCRIPTION: Composite: Renders a cyan line between points (279, 99) and (350, 244) then Creates a purple rectangular region at (399, 214) spanning 14 by 25 pixels.
; PLAN: r0=279(x1), r1=99(y1), r2=350(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=214(y), r7=14(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 99
LDI r2, 350
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 214
LDI r7, 14
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
