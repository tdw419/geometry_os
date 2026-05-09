; DESCRIPTION: Composite: Sets a single cyan pixel at (464, 7) then Places a white 71x115 rectangle at position (377, 125) then Draws a yellow line from (450, 137) to (454, 10).
; PLAN: r0=464(x), r1=7(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=125(y), r7=71(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x1), r11=137(y1), r12=454(x2), r13=10(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 464
LDI r1, 7
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 125
LDI r7, 71
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 137
LDI r12, 454
LDI r13, 10
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
