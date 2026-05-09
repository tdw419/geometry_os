; DESCRIPTION: Composite: Draws a black line from (333, 243) to (275, 218) then Places a red 35x111 rectangle at position (282, 85).
; PLAN: r0=333(x1), r1=243(y1), r2=275(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=85(y), r7=35(width), r8=111(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 243
LDI r2, 275
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 85
LDI r7, 35
LDI r8, 111
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
