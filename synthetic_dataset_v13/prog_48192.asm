; DESCRIPTION: Places a white 48x19 rectangle at position (432, 95).
; PLAN: r0=432(x), r1=95(y), r2=48(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 95
LDI r2, 48
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
