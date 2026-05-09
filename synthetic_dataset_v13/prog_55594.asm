; DESCRIPTION: Places a yellow 56x116 rectangle at position (172, 132).
; PLAN: r0=172(x), r1=132(y), r2=56(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 132
LDI r2, 56
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
