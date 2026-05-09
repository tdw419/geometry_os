; DESCRIPTION: Composite: Creates a magenta circular shape at (405, 168) with radius 62 then Draws a magenta line from (108, 28) to (424, 7) then Places a cyan dot at position (60, 187).
; PLAN: r0=405(x), r1=168(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=28(y1), r7=424(x2), r8=7(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=187(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 168
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 28
LDI r7, 424
LDI r8, 7
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 187
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
