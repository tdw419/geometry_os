; DESCRIPTION: Composite: Draws a white line from (70, 14) to (392, 19) then Places a magenta 96x119 rectangle at position (409, 87).
; PLAN: r0=70(x1), r1=14(y1), r2=392(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=87(y), r7=96(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 14
LDI r2, 392
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 87
LDI r7, 96
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
