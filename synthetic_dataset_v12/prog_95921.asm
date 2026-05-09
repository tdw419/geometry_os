; DESCRIPTION: Draws a orange circle centered at (301, 168) with radius 28.
; PLAN: r0=301(x), r1=168(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 168
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
