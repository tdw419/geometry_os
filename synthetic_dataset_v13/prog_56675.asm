; DESCRIPTION: Creates a black rectangular region at (213, 128) spanning 104 by 113 pixels.
; PLAN: r0=213(x), r1=128(y), r2=104(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 128
LDI r2, 104
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
