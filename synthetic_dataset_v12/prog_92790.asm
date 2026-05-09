; DESCRIPTION: Composite: Places a cyan dot at position (378, 161) then Renders a green box of size 12x113 starting at (434, 90) then Draws a cyan line from (4, 231) to (384, 122).
; PLAN: r0=378(x), r1=161(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=90(y), r7=12(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=4(x1), r11=231(y1), r12=384(x2), r13=122(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 161
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 434
LDI r6, 90
LDI r7, 12
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 4
LDI r11, 231
LDI r12, 384
LDI r13, 122
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
