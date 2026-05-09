; DESCRIPTION: Places a red 92x112 rectangle at position (239, 6).
; PLAN: r0=239(x), r1=6(y), r2=92(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 6
LDI r2, 92
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
