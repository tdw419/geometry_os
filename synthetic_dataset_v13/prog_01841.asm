; DESCRIPTION: Composite: Places a black 25x38 rectangle at position (311, 24) then Renders a black line between points (422, 125) and (52, 230).
; PLAN: r0=311(x), r1=24(y), r2=25(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=125(y1), r7=52(x2), r8=230(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 24
LDI r2, 25
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 125
LDI r7, 52
LDI r8, 230
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
