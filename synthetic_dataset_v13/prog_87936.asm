; DESCRIPTION: Creates a yellow rectangular region at (464, 165) spanning 25 by 45 pixels.
; PLAN: r0=464(x), r1=165(y), r2=25(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 165
LDI r2, 25
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
