; DESCRIPTION: Composite: Renders a cyan box of size 53x86 starting at (75, 77) then Places a white line segment connecting (309, 121) to (119, 172).
; PLAN: r0=75(x), r1=77(y), r2=53(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=121(y1), r7=119(x2), r8=172(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 75
LDI r1, 77
LDI r2, 53
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 121
LDI r7, 119
LDI r8, 172
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
