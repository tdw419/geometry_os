; DESCRIPTION: Draws a red circle centered at (446, 120) with radius 10.
; PLAN: r0=446(x), r1=120(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 120
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
