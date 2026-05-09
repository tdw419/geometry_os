; DESCRIPTION: Composite: Renders a purple box of size 48x111 starting at (187, 9) then Draws a purple line from (298, 98) to (60, 42).
; PLAN: r0=187(x), r1=9(y), r2=48(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x1), r6=98(y1), r7=60(x2), r8=42(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 9
LDI r2, 48
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 98
LDI r7, 60
LDI r8, 42
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
