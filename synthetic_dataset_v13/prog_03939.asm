; DESCRIPTION: Composite: Places a green line segment connecting (209, 97) to (422, 48) then Places a white 113x60 rectangle at position (258, 118).
; PLAN: r0=209(x1), r1=97(y1), r2=422(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=118(y), r7=113(width), r8=60(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 97
LDI r2, 422
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 118
LDI r7, 113
LDI r8, 60
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
