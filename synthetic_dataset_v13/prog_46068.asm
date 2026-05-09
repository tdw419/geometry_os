; DESCRIPTION: Creates a yellow rectangular region at (401, 223) spanning 48 by 17 pixels.
; PLAN: r0=401(x), r1=223(y), r2=48(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 223
LDI r2, 48
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
