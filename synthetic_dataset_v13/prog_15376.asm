; DESCRIPTION: Composite: Places a yellow 18x82 rectangle at position (0, 31) then Renders a blue line between points (445, 62) and (348, 130).
; PLAN: r0=0(x), r1=31(y), r2=18(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x1), r6=62(y1), r7=348(x2), r8=130(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 0
LDI r1, 31
LDI r2, 18
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 62
LDI r7, 348
LDI r8, 130
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
