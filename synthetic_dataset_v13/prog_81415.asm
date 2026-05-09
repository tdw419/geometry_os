; DESCRIPTION: Places a white 91x86 rectangle at position (78, 73).
; PLAN: r0=78(x), r1=73(y), r2=91(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 73
LDI r2, 91
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
