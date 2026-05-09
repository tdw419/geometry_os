; DESCRIPTION: Composite: Places a white 33x60 rectangle at position (179, 134) then Draws a orange line from (312, 32) to (480, 120).
; PLAN: r0=179(x), r1=134(y), r2=33(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=32(y1), r7=480(x2), r8=120(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 134
LDI r2, 33
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 32
LDI r7, 480
LDI r8, 120
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
