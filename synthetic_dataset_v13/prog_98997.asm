; DESCRIPTION: Composite: Places a red line segment connecting (116, 108) to (364, 134) then Places a cyan 24x34 rectangle at position (215, 168).
; PLAN: r0=116(x1), r1=108(y1), r2=364(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=168(y), r7=24(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 116
LDI r1, 108
LDI r2, 364
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 168
LDI r7, 24
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
