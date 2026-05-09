; DESCRIPTION: Places a white 92x62 rectangle at position (196, 46).
; PLAN: r0=196(x), r1=46(y), r2=92(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 46
LDI r2, 92
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
