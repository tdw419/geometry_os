; DESCRIPTION: Places a orange 39x56 rectangle at position (350, 47).
; PLAN: r0=350(x), r1=47(y), r2=39(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 47
LDI r2, 39
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
