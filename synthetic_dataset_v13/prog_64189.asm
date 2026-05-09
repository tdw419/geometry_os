; DESCRIPTION: Places a orange 112x102 rectangle at position (92, 105).
; PLAN: r0=92(x), r1=105(y), r2=112(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 105
LDI r2, 112
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
