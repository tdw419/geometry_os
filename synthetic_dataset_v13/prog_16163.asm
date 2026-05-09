; DESCRIPTION: Composite: Renders a green line between points (372, 94) and (122, 183) then Places a cyan 42x21 rectangle at position (321, 96).
; PLAN: r0=372(x1), r1=94(y1), r2=122(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=96(y), r7=42(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 94
LDI r2, 122
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 96
LDI r7, 42
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
