; DESCRIPTION: Composite: Renders a magenta line between points (273, 61) and (386, 38) then Places a orange 29x19 rectangle at position (480, 18) then Sets a single magenta pixel at (206, 210).
; PLAN: r0=273(x1), r1=61(y1), r2=386(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=18(y), r7=29(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=210(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 61
LDI r2, 386
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 18
LDI r7, 29
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 210
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
