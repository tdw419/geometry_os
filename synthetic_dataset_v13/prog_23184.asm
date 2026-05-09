; DESCRIPTION: Composite: Places a yellow line segment connecting (61, 18) to (148, 41) then Places a cyan 61x80 rectangle at position (406, 151).
; PLAN: r0=61(x1), r1=18(y1), r2=148(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=151(y), r7=61(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 18
LDI r2, 148
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 151
LDI r7, 61
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
