; DESCRIPTION: Places a white 95x99 rectangle at position (21, 89).
; PLAN: r0=21(x), r1=89(y), r2=95(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 89
LDI r2, 95
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
