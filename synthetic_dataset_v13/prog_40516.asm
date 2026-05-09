; DESCRIPTION: Composite: Draws a magenta line from (464, 97) to (441, 98) then Places a white 48x104 rectangle at position (443, 120).
; PLAN: r0=464(x1), r1=97(y1), r2=441(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=120(y), r7=48(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 97
LDI r2, 441
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 120
LDI r7, 48
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
