; DESCRIPTION: Creates a blue rectangular region at (346, 25) spanning 120 by 18 pixels.
; PLAN: r0=346(x), r1=25(y), r2=120(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 25
LDI r2, 120
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
