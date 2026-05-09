; DESCRIPTION: Creates a white rectangular region at (198, 222) spanning 117 by 16 pixels.
; PLAN: r0=198(x), r1=222(y), r2=117(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 222
LDI r2, 117
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
