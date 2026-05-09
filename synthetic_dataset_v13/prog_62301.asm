; DESCRIPTION: Composite: Renders a red line between points (423, 41) and (326, 255) then Places a cyan 119x101 rectangle at position (240, 115).
; PLAN: r0=423(x1), r1=41(y1), r2=326(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=115(y), r7=119(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 41
LDI r2, 326
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 115
LDI r7, 119
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
