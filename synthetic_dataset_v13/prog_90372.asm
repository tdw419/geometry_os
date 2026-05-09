; DESCRIPTION: Places a magenta 46x102 rectangle at position (347, 129).
; PLAN: r0=347(x), r1=129(y), r2=46(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 129
LDI r2, 46
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
