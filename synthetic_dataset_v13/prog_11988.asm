; DESCRIPTION: Composite: Sets a single purple pixel at (477, 109) then Draws a black line from (392, 93) to (280, 223) then Places a cyan 55x38 rectangle at position (312, 5).
; PLAN: r0=477(x), r1=109(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=392(x1), r6=93(y1), r7=280(x2), r8=223(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=5(y), r12=55(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 109
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 392
LDI r6, 93
LDI r7, 280
LDI r8, 223
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 5
LDI r12, 55
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
