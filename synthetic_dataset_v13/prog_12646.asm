; DESCRIPTION: Composite: Renders a cyan line between points (292, 229) and (95, 11) then Places a magenta 59x26 rectangle at position (414, 22).
; PLAN: r0=292(x1), r1=229(y1), r2=95(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=22(y), r7=59(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 229
LDI r2, 95
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 22
LDI r7, 59
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
