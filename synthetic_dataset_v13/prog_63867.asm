; DESCRIPTION: Composite: Renders a purple disk with center (145, 213) and radius 41 then Renders a yellow box of size 79x35 starting at (429, 68) then Places a purple dot at position (103, 70).
; PLAN: r0=145(x), r1=213(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=429(x), r6=68(y), r7=79(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=103(x), r11=70(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 145
LDI r1, 213
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 429
LDI r6, 68
LDI r7, 79
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 70
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
