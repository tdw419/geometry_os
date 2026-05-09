; DESCRIPTION: Draws a white circle centered at (392, 168) with radius 69.
; PLAN: r0=392(x), r1=168(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 168
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
