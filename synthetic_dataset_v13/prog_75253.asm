; DESCRIPTION: Places a yellow 82x92 rectangle at position (280, 96).
; PLAN: r0=280(x), r1=96(y), r2=82(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 96
LDI r2, 82
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
