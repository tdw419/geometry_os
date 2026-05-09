; DESCRIPTION: Places a blue 104x46 rectangle at position (173, 138).
; PLAN: r0=173(x), r1=138(y), r2=104(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 138
LDI r2, 104
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
