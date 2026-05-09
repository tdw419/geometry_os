; DESCRIPTION: Creates a red circular shape at (113, 146) with radius 55.
; PLAN: r0=113(x), r1=146(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 146
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
