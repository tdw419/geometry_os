; DESCRIPTION: Places a red 17x59 rectangle at position (324, 152).
; PLAN: r0=324(x), r1=152(y), r2=17(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 152
LDI r2, 17
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
