; DESCRIPTION: Places a white 47x10 rectangle at position (182, 65).
; PLAN: r0=182(x), r1=65(y), r2=47(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 65
LDI r2, 47
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
