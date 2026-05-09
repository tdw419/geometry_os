; DESCRIPTION: Composite: Places a blue circle of radius 60 at center (166, 133) then Draws a orange rectangle at (392, 57) with width 40 and height 91 then Places a purple dot at position (401, 24).
; PLAN: r0=166(x), r1=133(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=57(y), r7=40(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=401(x), r11=24(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 166
LDI r1, 133
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 57
LDI r7, 40
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 24
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
