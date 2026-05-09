; DESCRIPTION: Composite: Places a blue 119x61 rectangle at position (393, 79) then Renders a red line between points (402, 129) and (46, 9).
; PLAN: r0=393(x), r1=79(y), r2=119(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x1), r6=129(y1), r7=46(x2), r8=9(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 79
LDI r2, 119
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 129
LDI r7, 46
LDI r8, 9
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
