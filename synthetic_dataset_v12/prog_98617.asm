; DESCRIPTION: Composite: Places a yellow 13x68 rectangle at position (145, 32) then Places a white line segment connecting (295, 165) to (409, 74).
; PLAN: r0=145(x), r1=32(y), r2=13(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x1), r6=165(y1), r7=409(x2), r8=74(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 32
LDI r2, 13
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 165
LDI r7, 409
LDI r8, 74
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
