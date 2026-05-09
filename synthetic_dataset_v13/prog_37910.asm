; DESCRIPTION: Composite: Creates a magenta circular shape at (121, 108) with radius 73 then Renders a orange line between points (284, 215) and (18, 184) then Sets a single magenta pixel at (354, 41).
; PLAN: r0=121(x), r1=108(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=215(y1), r7=18(x2), r8=184(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=41(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 121
LDI r1, 108
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 215
LDI r7, 18
LDI r8, 184
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 41
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
