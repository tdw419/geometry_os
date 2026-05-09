; DESCRIPTION: Composite: Draws a magenta line from (443, 228) to (391, 210) then Sets a single purple pixel at (279, 231) then Places a white circle of radius 13 at center (456, 224).
; PLAN: r0=443(x1), r1=228(y1), r2=391(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=456(x), r11=224(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 443
LDI r1, 228
LDI r2, 391
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 456
LDI r11, 224
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
