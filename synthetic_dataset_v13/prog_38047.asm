; DESCRIPTION: Composite: Creates a red rectangular region at (451, 148) spanning 55 by 42 pixels then Renders a green line between points (420, 201) and (423, 111) then Places a orange dot at position (50, 197).
; PLAN: r0=451(x), r1=148(y), r2=55(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=201(y1), r7=423(x2), r8=111(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=197(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 148
LDI r2, 55
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 201
LDI r7, 423
LDI r8, 111
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 197
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
