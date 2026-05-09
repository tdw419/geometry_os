; DESCRIPTION: Places a yellow 26x113 rectangle at position (152, 96).
; PLAN: r0=152(x), r1=96(y), r2=26(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 96
LDI r2, 26
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
