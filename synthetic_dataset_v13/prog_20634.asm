; DESCRIPTION: Places a yellow 32x46 rectangle at position (453, 203).
; PLAN: r0=453(x), r1=203(y), r2=32(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 203
LDI r2, 32
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
