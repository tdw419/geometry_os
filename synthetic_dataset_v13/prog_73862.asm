; DESCRIPTION: Composite: Creates a magenta rectangular region at (267, 129) spanning 102 by 114 pixels then Renders a green line between points (479, 6) and (105, 39).
; PLAN: r0=267(x), r1=129(y), r2=102(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x1), r6=6(y1), r7=105(x2), r8=39(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 129
LDI r2, 102
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 6
LDI r7, 105
LDI r8, 39
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
