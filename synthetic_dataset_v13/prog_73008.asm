; DESCRIPTION: Places a orange 36x24 rectangle at position (128, 169).
; PLAN: r0=128(x), r1=169(y), r2=36(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 169
LDI r2, 36
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
