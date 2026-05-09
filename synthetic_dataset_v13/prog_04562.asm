; DESCRIPTION: Draws a red circle centered at (284, 95) with radius 46.
; PLAN: r0=284(x), r1=95(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 95
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
