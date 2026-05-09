; DESCRIPTION: Composite: Draws a red line from (386, 52) to (132, 217) then Creates a cyan rectangular region at (286, 26) spanning 56 by 65 pixels.
; PLAN: r0=386(x1), r1=52(y1), r2=132(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=286(x), r6=26(y), r7=56(width), r8=65(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 52
LDI r2, 132
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 26
LDI r7, 56
LDI r8, 65
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
