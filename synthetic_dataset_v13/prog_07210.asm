; DESCRIPTION: Composite: Renders a purple line between points (135, 78) and (493, 222) then Creates a cyan rectangular region at (300, 42) spanning 51 by 52 pixels.
; PLAN: r0=135(x1), r1=78(y1), r2=493(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=42(y), r7=51(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 78
LDI r2, 493
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 42
LDI r7, 51
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
