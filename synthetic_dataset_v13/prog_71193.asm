; DESCRIPTION: Composite: Places a purple line segment connecting (82, 182) to (113, 33) then Renders a magenta box of size 18x16 starting at (271, 79).
; PLAN: r0=82(x1), r1=182(y1), r2=113(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=79(y), r7=18(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 182
LDI r2, 113
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 79
LDI r7, 18
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
