; DESCRIPTION: Composite: Places a cyan 12x116 rectangle at position (467, 60) then Draws a blue line from (442, 55) to (332, 215).
; PLAN: r0=467(x), r1=60(y), r2=12(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x1), r6=55(y1), r7=332(x2), r8=215(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 467
LDI r1, 60
LDI r2, 12
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 55
LDI r7, 332
LDI r8, 215
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
