; DESCRIPTION: Composite: Renders a black box of size 71x42 starting at (379, 44) then Draws a white line from (51, 18) to (25, 84).
; PLAN: r0=379(x), r1=44(y), r2=71(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x1), r6=18(y1), r7=25(x2), r8=84(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 44
LDI r2, 71
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 18
LDI r7, 25
LDI r8, 84
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
