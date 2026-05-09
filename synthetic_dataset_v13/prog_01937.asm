; DESCRIPTION: Places a orange 89x34 rectangle at position (240, 192).
; PLAN: r0=240(x), r1=192(y), r2=89(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 192
LDI r2, 89
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
