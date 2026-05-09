; DESCRIPTION: Composite: Renders a green box of size 11x55 starting at (202, 159) then Renders a cyan line between points (406, 76) and (153, 190).
; PLAN: r0=202(x), r1=159(y), r2=11(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=76(y1), r7=153(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 159
LDI r2, 11
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 76
LDI r7, 153
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
