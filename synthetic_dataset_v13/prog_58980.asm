; DESCRIPTION: Places a red 33x57 rectangle at position (281, 69).
; PLAN: r0=281(x), r1=69(y), r2=33(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 69
LDI r2, 33
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
