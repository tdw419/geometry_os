; DESCRIPTION: Composite: Renders a white line between points (211, 38) and (281, 9) then Places a red 85x16 rectangle at position (200, 68).
; PLAN: r0=211(x1), r1=38(y1), r2=281(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=68(y), r7=85(width), r8=16(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 38
LDI r2, 281
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 68
LDI r7, 85
LDI r8, 16
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
