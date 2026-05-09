; DESCRIPTION: Places a red 47x48 rectangle at position (135, 88).
; PLAN: r0=135(x), r1=88(y), r2=47(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 88
LDI r2, 47
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
