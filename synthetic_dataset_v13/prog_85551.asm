; DESCRIPTION: Places a red 112x56 rectangle at position (147, 165).
; PLAN: r0=147(x), r1=165(y), r2=112(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 165
LDI r2, 112
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
