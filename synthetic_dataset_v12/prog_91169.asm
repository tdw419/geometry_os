; DESCRIPTION: Composite: Renders a yellow line between points (381, 231) and (271, 90) then Places a yellow 105x76 rectangle at position (93, 82).
; PLAN: r0=381(x1), r1=231(y1), r2=271(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=82(y), r7=105(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 231
LDI r2, 271
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 82
LDI r7, 105
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
