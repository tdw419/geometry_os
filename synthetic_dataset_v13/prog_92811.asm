; DESCRIPTION: Composite: Draws a magenta line from (113, 230) to (315, 168) then Renders a cyan box of size 106x53 starting at (93, 68).
; PLAN: r0=113(x1), r1=230(y1), r2=315(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=68(y), r7=106(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 230
LDI r2, 315
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 68
LDI r7, 106
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
