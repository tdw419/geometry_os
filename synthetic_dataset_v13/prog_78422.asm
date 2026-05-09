; DESCRIPTION: Composite: Renders a purple box of size 52x30 starting at (303, 166) then Draws a cyan line from (276, 114) to (130, 14).
; PLAN: r0=303(x), r1=166(y), r2=52(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=114(y1), r7=130(x2), r8=14(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 166
LDI r2, 52
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 114
LDI r7, 130
LDI r8, 14
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
