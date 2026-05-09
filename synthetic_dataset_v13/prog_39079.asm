; DESCRIPTION: Places a orange 112x105 rectangle at position (361, 20).
; PLAN: r0=361(x), r1=20(y), r2=112(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 20
LDI r2, 112
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
