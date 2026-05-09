; DESCRIPTION: Places a black 27x113 rectangle at position (416, 108).
; PLAN: r0=416(x), r1=108(y), r2=27(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 108
LDI r2, 27
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
