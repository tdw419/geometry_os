; DESCRIPTION: Composite: Places a purple 46x96 rectangle at position (273, 96) then Renders a black line between points (154, 87) and (452, 29).
; PLAN: r0=273(x), r1=96(y), r2=46(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x1), r6=87(y1), r7=452(x2), r8=29(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 96
LDI r2, 46
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 87
LDI r7, 452
LDI r8, 29
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
