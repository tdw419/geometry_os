; DESCRIPTION: Composite: Draws a white rectangle at (422, 42) with width 30 and height 25 then Draws a magenta line from (255, 195) to (405, 191).
; PLAN: r0=422(x), r1=42(y), r2=30(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x1), r6=195(y1), r7=405(x2), r8=191(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 42
LDI r2, 30
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 195
LDI r7, 405
LDI r8, 191
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
