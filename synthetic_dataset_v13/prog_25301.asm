; DESCRIPTION: Composite: Creates a white rectangular region at (301, 4) spanning 113 by 86 pixels then Renders a cyan line between points (177, 208) and (190, 108).
; PLAN: r0=301(x), r1=4(y), r2=113(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x1), r6=208(y1), r7=190(x2), r8=108(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 4
LDI r2, 113
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 208
LDI r7, 190
LDI r8, 108
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
