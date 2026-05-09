; DESCRIPTION: Places a red 44x84 rectangle at position (350, 28).
; PLAN: r0=350(x), r1=28(y), r2=44(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 28
LDI r2, 44
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
