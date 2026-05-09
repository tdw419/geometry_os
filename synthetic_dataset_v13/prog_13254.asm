; DESCRIPTION: Composite: Renders a cyan box of size 85x33 starting at (243, 215) then Renders a purple line between points (344, 172) and (265, 23).
; PLAN: r0=243(x), r1=215(y), r2=85(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=172(y1), r7=265(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 243
LDI r1, 215
LDI r2, 85
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 172
LDI r7, 265
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
