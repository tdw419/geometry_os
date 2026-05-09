; DESCRIPTION: Composite: Renders a purple box of size 103x115 starting at (303, 40) then Draws a yellow line from (116, 66) to (386, 87).
; PLAN: r0=303(x), r1=40(y), r2=103(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=66(y1), r7=386(x2), r8=87(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 40
LDI r2, 103
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 66
LDI r7, 386
LDI r8, 87
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
