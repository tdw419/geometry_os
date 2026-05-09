; DESCRIPTION: Creates a yellow rectangular region at (293, 25) spanning 74 by 50 pixels.
; PLAN: r0=293(x), r1=25(y), r2=74(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 25
LDI r2, 74
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
