; DESCRIPTION: Composite: Draws a black line from (467, 16) to (350, 171) then Renders a green box of size 115x120 starting at (289, 97).
; PLAN: r0=467(x1), r1=16(y1), r2=350(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=97(y), r7=115(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 16
LDI r2, 350
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 97
LDI r7, 115
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
