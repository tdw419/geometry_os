; DESCRIPTION: Composite: Places a cyan 77x36 rectangle at position (348, 70) then Sets a single white pixel at (262, 184) then Draws a magenta line from (412, 120) to (387, 70).
; PLAN: r0=348(x), r1=70(y), r2=77(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=184(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=412(x1), r11=120(y1), r12=387(x2), r13=70(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 70
LDI r2, 77
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 184
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 412
LDI r11, 120
LDI r12, 387
LDI r13, 70
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
