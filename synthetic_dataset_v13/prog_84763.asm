; DESCRIPTION: Places a yellow 106x56 rectangle at position (358, 196).
; PLAN: r0=358(x), r1=196(y), r2=106(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 196
LDI r2, 106
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
