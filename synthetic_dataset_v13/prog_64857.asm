; DESCRIPTION: Composite: Places a blue 111x93 rectangle at position (368, 26) then Draws a magenta line from (392, 173) to (386, 194) then Places a white dot at position (387, 83).
; PLAN: r0=368(x), r1=26(y), r2=111(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x1), r6=173(y1), r7=386(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=83(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 368
LDI r1, 26
LDI r2, 111
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 173
LDI r7, 386
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 83
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
