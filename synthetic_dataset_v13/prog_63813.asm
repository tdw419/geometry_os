; DESCRIPTION: Draws a red circle centered at (135, 124) with radius 68.
; PLAN: r0=135(x), r1=124(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 124
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
