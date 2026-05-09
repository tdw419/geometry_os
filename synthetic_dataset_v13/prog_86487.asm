; DESCRIPTION: Composite: Places a cyan line segment connecting (98, 109) to (458, 140) then Renders a yellow box of size 44x74 starting at (465, 66).
; PLAN: r0=98(x1), r1=109(y1), r2=458(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=465(x), r6=66(y), r7=44(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 109
LDI r2, 458
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 66
LDI r7, 44
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
