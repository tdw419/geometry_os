; DESCRIPTION: Composite: Renders a orange disk with center (168, 122) and radius 56 then Renders a blue box of size 103x40 starting at (405, 97) then Places a orange dot at position (451, 31).
; PLAN: r0=168(x), r1=122(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=97(y), r7=103(width), r8=40(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=31(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 168
LDI r1, 122
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 97
LDI r7, 103
LDI r8, 40
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 31
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
