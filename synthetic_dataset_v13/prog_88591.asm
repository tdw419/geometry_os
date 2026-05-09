; DESCRIPTION: Composite: Renders a orange line between points (93, 129) and (52, 111) then Places a blue 83x76 rectangle at position (66, 52).
; PLAN: r0=93(x1), r1=129(y1), r2=52(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=52(y), r7=83(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 129
LDI r2, 52
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 52
LDI r7, 83
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
