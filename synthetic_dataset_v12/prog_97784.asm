; DESCRIPTION: Composite: Creates a black rectangular region at (215, 121) spanning 52 by 74 pixels then Draws a white line from (464, 134) to (132, 48).
; PLAN: r0=215(x), r1=121(y), r2=52(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x1), r6=134(y1), r7=132(x2), r8=48(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 121
LDI r2, 52
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 134
LDI r7, 132
LDI r8, 48
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
