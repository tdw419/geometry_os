; DESCRIPTION: Composite: Renders a magenta box of size 50x30 starting at (459, 3) then Renders a purple line between points (126, 145) and (502, 190).
; PLAN: r0=459(x), r1=3(y), r2=50(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=145(y1), r7=502(x2), r8=190(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 3
LDI r2, 50
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 145
LDI r7, 502
LDI r8, 190
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
