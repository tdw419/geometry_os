; DESCRIPTION: Composite: Places a white 110x114 rectangle at position (302, 129) then Renders a white line between points (395, 190) and (465, 164).
; PLAN: r0=302(x), r1=129(y), r2=110(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x1), r6=190(y1), r7=465(x2), r8=164(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 302
LDI r1, 129
LDI r2, 110
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 190
LDI r7, 465
LDI r8, 164
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
