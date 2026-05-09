; DESCRIPTION: Composite: Renders a cyan box of size 82x55 starting at (42, 190) then Renders a red line between points (68, 186) and (88, 65).
; PLAN: r0=42(x), r1=190(y), r2=82(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x1), r6=186(y1), r7=88(x2), r8=65(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 190
LDI r2, 82
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 186
LDI r7, 88
LDI r8, 65
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
