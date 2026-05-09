; DESCRIPTION: Composite: Draws a white line from (373, 155) to (28, 70) then Places a cyan 87x116 rectangle at position (203, 94).
; PLAN: r0=373(x1), r1=155(y1), r2=28(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=94(y), r7=87(width), r8=116(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 373
LDI r1, 155
LDI r2, 28
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 94
LDI r7, 87
LDI r8, 116
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
