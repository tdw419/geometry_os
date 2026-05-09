; DESCRIPTION: Composite: Renders a cyan box of size 30x44 starting at (217, 51) then Draws a magenta line from (71, 188) to (153, 90).
; PLAN: r0=217(x), r1=51(y), r2=30(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x1), r6=188(y1), r7=153(x2), r8=90(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 51
LDI r2, 30
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 188
LDI r7, 153
LDI r8, 90
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
