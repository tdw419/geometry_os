; DESCRIPTION: Composite: Creates a red circular shape at (383, 127) with radius 71 then Renders a red box of size 18x67 starting at (493, 133) then Sets a single magenta pixel at (160, 94).
; PLAN: r0=383(x), r1=127(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=493(x), r6=133(y), r7=18(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=94(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 127
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 493
LDI r6, 133
LDI r7, 18
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 94
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
