; DESCRIPTION: Places a red 84x18 rectangle at position (127, 222).
; PLAN: r0=127(x), r1=222(y), r2=84(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 222
LDI r2, 84
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
