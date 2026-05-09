; DESCRIPTION: Places a orange 84x12 rectangle at position (425, 169).
; PLAN: r0=425(x), r1=169(y), r2=84(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 169
LDI r2, 84
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
