; DESCRIPTION: Composite: Draws a yellow line from (354, 126) to (245, 86) then Renders a orange box of size 21x59 starting at (24, 168) then Sets a single magenta pixel at (400, 116).
; PLAN: r0=354(x1), r1=126(y1), r2=245(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=168(y), r7=21(width), r8=59(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=116(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 354
LDI r1, 126
LDI r2, 245
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 168
LDI r7, 21
LDI r8, 59
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 116
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
