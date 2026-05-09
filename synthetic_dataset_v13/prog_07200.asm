; DESCRIPTION: Composite: Renders a cyan line between points (375, 243) and (167, 30) then Places a red 76x74 rectangle at position (254, 38).
; PLAN: r0=375(x1), r1=243(y1), r2=167(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=38(y), r7=76(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 243
LDI r2, 167
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 38
LDI r7, 76
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
