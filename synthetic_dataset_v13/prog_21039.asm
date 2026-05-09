; DESCRIPTION: Composite: Places a cyan line segment connecting (206, 41) to (457, 146) then Places a black 34x74 rectangle at position (27, 80).
; PLAN: r0=206(x1), r1=41(y1), r2=457(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=80(y), r7=34(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 41
LDI r2, 457
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 80
LDI r7, 34
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
