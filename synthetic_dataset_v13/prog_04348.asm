; DESCRIPTION: Composite: Places a green 25x60 rectangle at position (401, 107) then Places a blue line segment connecting (308, 203) to (422, 248).
; PLAN: r0=401(x), r1=107(y), r2=25(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x1), r6=203(y1), r7=422(x2), r8=248(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 107
LDI r2, 25
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 203
LDI r7, 422
LDI r8, 248
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
