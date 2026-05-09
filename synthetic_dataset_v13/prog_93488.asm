; DESCRIPTION: Places a yellow 28x11 rectangle at position (172, 1).
; PLAN: r0=172(x), r1=1(y), r2=28(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 1
LDI r2, 28
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
