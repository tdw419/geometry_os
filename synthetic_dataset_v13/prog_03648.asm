; DESCRIPTION: Composite: Draws a cyan line from (238, 55) to (70, 234) then Places a black 106x56 rectangle at position (36, 166).
; PLAN: r0=238(x1), r1=55(y1), r2=70(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=166(y), r7=106(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 238
LDI r1, 55
LDI r2, 70
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 166
LDI r7, 106
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
