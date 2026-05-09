; DESCRIPTION: Composite: Renders a cyan disk with center (387, 98) and radius 74 then Renders a cyan box of size 47x49 starting at (138, 94) then Draws a black line from (474, 42) to (25, 164).
; PLAN: r0=387(x), r1=98(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=94(y), r7=47(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=474(x1), r11=42(y1), r12=25(x2), r13=164(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 98
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 94
LDI r7, 47
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 42
LDI r12, 25
LDI r13, 164
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
