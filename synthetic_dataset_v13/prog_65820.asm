; DESCRIPTION: Places a green 92x68 rectangle at position (269, 138).
; PLAN: r0=269(x), r1=138(y), r2=92(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 138
LDI r2, 92
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
