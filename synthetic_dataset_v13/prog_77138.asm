; DESCRIPTION: Composite: Renders a white line between points (26, 53) and (438, 39) then Places a cyan 80x92 rectangle at position (121, 62).
; PLAN: r0=26(x1), r1=53(y1), r2=438(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=62(y), r7=80(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 53
LDI r2, 438
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 62
LDI r7, 80
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
