; DESCRIPTION: Renders a black box of size 56x61 starting at (16, 152).
; PLAN: r0=16(x), r1=152(y), r2=56(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 152
LDI r2, 56
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
