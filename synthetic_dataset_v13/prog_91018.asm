; DESCRIPTION: Places a green 76x112 rectangle at position (92, 82).
; PLAN: r0=92(x), r1=82(y), r2=76(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 82
LDI r2, 76
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
