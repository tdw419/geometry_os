; DESCRIPTION: Composite: Renders a white line between points (372, 66) and (76, 129) then Places a purple 85x107 rectangle at position (117, 48).
; PLAN: r0=372(x1), r1=66(y1), r2=76(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=48(y), r7=85(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 66
LDI r2, 76
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 48
LDI r7, 85
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
