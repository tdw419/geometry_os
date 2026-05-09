; DESCRIPTION: Composite: Renders a cyan box of size 24x91 starting at (294, 74) then Renders a white line between points (68, 207) and (53, 228) then Places a black dot at position (314, 194).
; PLAN: r0=294(x), r1=74(y), r2=24(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x1), r6=207(y1), r7=53(x2), r8=228(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=194(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 74
LDI r2, 24
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 207
LDI r7, 53
LDI r8, 228
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 194
LDI r12, 0x000000
PSET r10, r11, r12
HALT
