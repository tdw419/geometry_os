; DESCRIPTION: Composite: Creates a cyan rectangular region at (421, 102) spanning 47 by 80 pixels then Renders a magenta line between points (24, 240) and (231, 142).
; PLAN: r0=421(x), r1=102(y), r2=47(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x1), r6=240(y1), r7=231(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 102
LDI r2, 47
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 240
LDI r7, 231
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
