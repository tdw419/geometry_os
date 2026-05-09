; DESCRIPTION: Places a green 120x92 rectangle at position (69, 15).
; PLAN: r0=69(x), r1=15(y), r2=120(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 15
LDI r2, 120
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
