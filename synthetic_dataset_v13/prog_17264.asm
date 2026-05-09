; DESCRIPTION: Composite: Draws a red line from (289, 182) to (345, 45) then Renders a magenta box of size 66x113 starting at (243, 1).
; PLAN: r0=289(x1), r1=182(y1), r2=345(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=1(y), r7=66(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 182
LDI r2, 345
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 1
LDI r7, 66
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
