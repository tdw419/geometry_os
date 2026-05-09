; DESCRIPTION: Composite: Renders a white line between points (324, 39) and (47, 152) then Places a blue 111x90 rectangle at position (201, 118).
; PLAN: r0=324(x1), r1=39(y1), r2=47(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=118(y), r7=111(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 324
LDI r1, 39
LDI r2, 47
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 118
LDI r7, 111
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
