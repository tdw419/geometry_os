; DESCRIPTION: Places a white 92x73 rectangle at position (241, 46).
; PLAN: r0=241(x), r1=46(y), r2=92(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 46
LDI r2, 92
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
