; DESCRIPTION: Composite: Creates a cyan circular shape at (154, 166) with radius 21 then Draws a magenta line from (443, 54) to (161, 157) then Places a cyan dot at position (28, 138).
; PLAN: r0=154(x), r1=166(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x1), r6=54(y1), r7=161(x2), r8=157(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=28(x), r11=138(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 166
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 54
LDI r7, 161
LDI r8, 157
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 28
LDI r11, 138
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
