; DESCRIPTION: Places a green 102x92 rectangle at position (332, 1).
; PLAN: r0=332(x), r1=1(y), r2=102(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 1
LDI r2, 102
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
